const xml2js = require('xml2js');
const langs = require('langs');
const util = require('util');
const fs = require('fs');

const parser = new xml2js.Parser();

main(process.argv[2], process.argv[3]).then(() => {

}).catch((err) => {
	console.log(err);
});

async function main(xmlFile, jsonFile) {
	const xml = await readFile(xmlFile, 'utf-8');
	const json = JSON.parse(await readFile(jsonFile, 'utf-8'));
	const data = await parseXML(xml);
	for (const i in json.series) {
		let animeFound = false;
		for (const anime of data.animetitles.anime) {
			//Search for x-jat title
			let xjatIndex;
			if (anime.title.some((title, index) => {
				if (title.$.type === 'main' && title.$['xml:lang'] === 'x-jat') {
					xjatIndex = index;
					return true;
				}
				return false;
			})) {
				// X-jat is found. Parse our JSON to determine if we have that series
				if (json.series[i].name === anime.title[xjatIndex]._) {						animeFound = true;
					// Series found!
					// Parse all entries
					for (const title of anime.title) {
						if (title.$.type === 'syn' || title.$.type === 'short') {
							// Title should be added to aliases if it doesn't exist already
							if (json.series[i].aliases) {
								if (!json.series[i].aliases.includes(title._)) json.series[i].aliases.push(title._);
							} else {
								json.series[i].aliases = [title._];
							}
						}
						if (title.$.type === 'main' || title.$.type === 'official') {
							//Determine iso639-2B language
							if (title.$['xml:lang'] !== 'x-jat') {
								const shortLang = title.$['xml:lang'].substring(0,2);
								if (langs.has('1',shortLang)) {
									const lang = langs.where('1', shortLang);
									json.series[i].i18n[lang['2B']] = title._;
								} else {
									console.log('Language unknown ('+title.$['xml:lang']+') for series '+anime.title[xjatIndex]._);
								}
							}
						}
					}
				}
			}
		}
		if (!animeFound) {
			// Series not found in our series.json
			console.log('WARNING : Series not found in aniDB : '+json.series[i].name);
		}
	}
	await writeFile('out.json',JSON.stringify(json,null,2), 'utf-8');
}

async function parseXML(...args) {
	return util.promisify(parser.parseString)(...args);
}

async function readFile(...args) {
	return util.promisify(fs.readFile)(...args);
}

async function writeFile(...args) {
	return util.promisify(fs.writeFile)(...args);
}