const {resolve} = require('path');
const {promisify} = require('util');
const {readFile, readdir} = require('fs');

const kpath = '../../karaokes';
const tpath = '../../tags';
const authors = [];
const contributors = [];
const newKaras = [];
const modifiedKaras = [];

const start = new Date(process.argv[2] + '-01');
const end = new Date(process.argv[2] + '-31');

const asyncReadFile = (...args) => passThroughFunction(readFile, args);
const asyncReadDir = (...args) => passThroughFunction(readdir, args);
const passThroughFunction = (fn, args) => {
	if(!Array.isArray(args)) args = [args];
	return promisify(fn)(...args);
};

async function readTags() {
	const dir = await asyncReadDir(tpath);
	for (const file of dir) {
		const data = await asyncReadFile(resolve(tpath, file), 'utf-8');
		const tag = JSON.parse(data);
		if (tag.tag.types.includes('authors')) authors.push(tag.tag);
	}
}

async function readKaras() {
	const dir = await asyncReadDir(kpath);
	for (const file of dir) {
		const data = await asyncReadFile(resolve(kpath, file), 'utf-8');
		const kara = JSON.parse(data);
		kara.filename = file;
		const created_at = new Date(kara.data.created_at);
		const modified_at = new Date(kara.data.modified_at);
		if (!kara.data.tags.authors) kara.data.tags.authors = [];
		let author = authors.find(a => a.tid === kara.data.tags.authors[0]);
		if (!author) author = {name: ''};
		if (created_at > start && created_at < end) {
			newKaras.push(`${kara.filename.replace('.kara.json','')} (@${author.name})`);
			contributors.push('@' + author.name);
		}
		if (created_at < start && modified_at > start && modified_at < end) modifiedKaras.push(`${kara.filename.replace('.kara.json','')}`);
	}
}

async function main() {
	await readTags();
	await readKaras();
	newKaras.sort();
	modifiedKaras.sort();
	console.log('Contributors: ');
	console.log('');
	contributors.sort();
	contributors.filter((item, index) => contributors.indexOf(item) === index).forEach(c => console.log('- ' + c));
	console.log('');
	console.log('## Added')
	console.log('');
	console.log('New songs : ' + newKaras.length);
	console.log('');
	newKaras.forEach(k => console.log('- ' + k));
	console.log('');
	console.log('## Fixed')
	console.log('');
	modifiedKaras.forEach(k => console.log('- ' + k));
}

main();