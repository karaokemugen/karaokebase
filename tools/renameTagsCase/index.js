const {resolve} = require('path');
const {promisify} = require('util');
const {readFile, readdir, writeFileSync} = require('fs');
const sanitizeFilename = require('sanitize-filename');
const deburr = require('lodash.deburr');

const tpath = '../../tags';

const asyncReadFile = (...args) => passThroughFunction(readFile, args);
const asyncReadDir = (...args) => passThroughFunction(readdir, args);
const passThroughFunction = (fn, args) => {
	if(!Array.isArray(args)) args = [args];
	return promisify(fn)(...args);
};

async function renameTags() {
	const dir = await asyncReadDir(tpath);
	for (const file of dir) {
		const data = await asyncReadFile(resolve(tpath, file), 'utf-8');
		const tag = JSON.parse(data);
		const tid = tag.tag.tid;
		const name = sanitizeFile(tag.tag.name);
		const nameFile = file.replace(`.${tid.substr(0, 8)}.tag.json`,'');
		if (name !== nameFile) {
			tag.tag.modified_at = new Date().toISOString();
			writeFileSync(resolve(tpath, file), JSON.stringify(tag, null, 2), 'utf-8');
			console.log('git mv', `"${file}"`, `"${name}.${tid.substr(0, 8)}.tag.json"`);
		}
	}
}

function sanitizeFile(file) {
	const replaceMap = {
		'·': '.',
		'・': '.',
		'Λ': 'A',
		'Я': 'R',
		'³': '3',
		'²': '2',
		'°': '0',
		'θ': '0',
		'Ø': '0',
		'○': 'O',
		'×': 'x',
		'Φ': 'O',
		'±': '+',
		'∀': 'A'
	};
	const replaceRegExp = new RegExp('[' + Object.keys(replaceMap).join('') + ']', 'ig');
	// Romanizing japanese characters by their romanization
	// Also making some obvious replacements of things we often find in japanese names.
	file = file.replace(/ô/g,'ou')
		.replace(/Ô/g,'Ou')
		.replace(/û/g,'uu')
		.replace(/µ's/g,'Mu\'s')
		.replace(/®/g,'(R)')
		.replace(/∆/g,'Delta')
		.replace(/Ω/g,'O')
		.replace(/;/g,' ')
		.replace(/\[/g,' ')
		.replace(/\]/g,' ')
		.replace(/[△:/☆★†↑½♪＊*∞♥❤♡⇄♬]/g, ' ')
		.replace(/…/g,'...')
		.replace(/\+/g,' Plus ')
		.replace(/＋/g, ' Plus ')
		.replace(/\?\?/g,' question_mark 2')
		.replace(/\?/g,' question_mark ')
		.replace(/^\./g,'')
		.replace(/♭/g,' Flat ')
		.replace(/%/g, ' percent ')
		.replace(replaceRegExp, input => {
			return replaceMap[input];
		})
	;
	// Remove all diacritics and other non-ascii characters we might have left
	// Also, remove useless spaces.
	file = deburr(file)
		.replace(/[^\x00-\xFF]/g, ' ' )
		.replace(/ [ ]+/g,' ')
	;
	// One last go using sanitizeFilename just in case.
	file = sanitizeFilename(file);
	file = file.trim();
	return file;
}

renameTags().catch(err => console.log(err));