// Modify kpath to point to a karaoke dir
const kpath = 'karas';


const {readFile, readdir, writeFile} = require('fs');
const path = require('path');
const {promisify} = require('util');
const {parse, stringify} = require('ini');

const asyncReadFile = (...args) => passThroughFunction(readFile, args);
const asyncReadDir = (...args) => passThroughFunction(readdir, args);
const asyncWriteFile = (...args) => passThroughFunction(writeFile, args);

const passThroughFunction = (fn, args) => {
	if(!Array.isArray(args)) args = [args];
	return promisify(fn)(...args);
};



async function main() {
	const dir = await asyncReadDir(kpath);
	for (const file of dir) {
		console.log(file);
		let data = await asyncReadFile(path.resolve(kpath, file), 'utf-8');
		data = data.replace(/\r/g, '');
		const content = parse(data);
		const y = content.year;
		let g = [];
		if (content.groups) g = content.groups.split(',');
		if (+y >= 1950 && +y <= 1959 && !g.includes('50s')) g.push('50s');
		if (+y >= 1960 && +y <= 1969 && !g.includes('60s')) g.push('60s');
		if (+y >= 1970 && +y <= 1979 && !g.includes('70s')) g.push('70s');
		if (+y >= 1980 && +y <= 1989 && !g.includes('80s')) g.push('80s');
		if (+y >= 1990 && +y <= 1999 && !g.includes('90s')) g.push('90s');
		if (+y >= 2000 && +y <= 2009 && !g.includes('2000s')) g.push('2000s');
		if (+y >= 2010 && +y <= 2019 && !g.includes('2010s')) g.push('2010s');
		content.groups = g.join(',');
		await asyncWriteFile(path.resolve(kpath, file), stringify(content), 'utf-8');
	}
}

main().catch(err => console.log(err));

