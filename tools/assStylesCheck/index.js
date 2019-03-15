const assStringify = require('ass-stringify');
const assParser = require('ass-parser');

const fs = require('fs');
const util = require('util');


const passThroughFunction = (fn, args) => {
	if(!Array.isArray(args)) args = [args];
	return util.promisify(fn)(...args);
};

const asyncReadFile = (...args) => passThroughFunction(fs.readFile, args);
const asyncReadDir = (...args) => passThroughFunction(fs.readdir, args);
const asyncWriteFile = (...args) => passThroughFunction(fs.writeFile, args);

async function main() {
	const files = await asyncReadDir('../../lyrics');
	for (const file of files) {
		const data = await asyncReadFile(`../../lyrics/${file}`,'utf8');
		const ass = assParser(data);
		//Find styles section
		const styleSection = ass.find(a => a.section.startsWith('V4'));
		//Parse styles
		const styles = [];
		for (const style of styleSection.body) {
			if (style.key === 'Style') styles.push(style.value.Name);
		}
		// Now we have all declared styles, lets parse Dialogue to see if any style is missing
		const events = ass.findIndex(a => a.section === 'Events');
		const badStyle = [];
		for (const i in ass[events].body) {
			if (ass[events].body[i].key === 'Dialogue' || ass[events].body[i].key === 'Comment') {
				const style = ass[events].body[i].value.Style;
				if (!styles.includes(style)) {
					ass[events].body[i].value.Style = styles[0];
					if (!badStyle.includes(style)) badStyle.push(style);
				}
			}
		}
		if (badStyle.length > 0) {
			console.log(`Missing styles (${badStyle.join(',')}) in ${file}. Declared styles are ${styles.join(',')}`);
			// Rewriting ass file with fixed style

			await asyncWriteFile(`../../lyrics/${file}`, assStringify(ass), 'utf8');
		}
	}
}

main().catch(err => console.log(err));