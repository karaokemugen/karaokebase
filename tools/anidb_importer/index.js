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
			let xjat;
			let jaOfficial;
			let enOfficial;
			anime.title.forEach((title, index) => {
				if (title.$.type === 'main' && title.$['xml:lang'] === 'x-jat') {
					xjat = title._;
				} else if (title.$.type === 'official' && title.$['xml:lang'] === 'ja') {
					jaOfficial = title._;
				} else if (title.$.type === 'official' && title.$['xml:lang'] === 'en') {
					enOfficial= title._;
				}
			})
			let regexp = /[\ \-\:\!\.\★\☆\♪\△\'\`]/g;
			// X-jat is found. Parse our JSON to determine if we have that series
			let karaokeMugenTitle = json.series[i].name.replace(/ô/g, 'ou').replace(/û/g, 'uu').replace(/ä/g, 'a').replace(regexp, '').toUpperCase();
			let equalToXjat = xjat && karaokeMugenTitle === xjat.replace(regexp, '').toUpperCase();
			let equalToJaOfficial = jaOfficial && karaokeMugenTitle === jaOfficial.replace(regexp, '').toUpperCase();
			let equalToEnOfficial = enOfficial && karaokeMugenTitle === enOfficial.replace(regexp, '').toUpperCase();
			let enEqualToEnOfficial = enOfficial && json.series[i].i18n.eng
				&& json.series[i].i18n.eng.replace(/ô/g, 'ou').replace(/û/g, 'uu').replace(/ä/g, 'a').replace(regexp, '').toUpperCase() 
				=== enOfficial.replace(regexp, '').toUpperCase();
			if (equalToXjat || equalToJaOfficial || equalToEnOfficial || enEqualToEnOfficial) {
				animeFound = true;
				// Series found!
				// Parse all entries
				for (const title of anime.title) {
					if (title.$.type === 'syn' || title.$.type === 'short' || title.$['xml:lang'] == 'ja') {
						// Title should be added to aliases if it doesn't exist already
						if (json.series[i].aliases) {
							let aliasesUpperCase = String(json.series[i].aliases).toUpperCase().split(",");
							if (!aliasesUpperCase.includes(title._.toUpperCase())) json.series[i].aliases.push(title._);
						} else {
							json.series[i] = { "name": json.series[i].name, aliases: [title._], "i18n": json.series[i].i18n };
						}
					} else if (title.$.type === 'main') {
						json.series[i].i18n['jpn'] = title._.replace('ou', 'ô').replace('uu', 'û');
					} else if (title.$.type === 'official' && title.$['xml:lang'] !== 'x-jat') {
						//Determine iso639-2B language
						const shortLang = title.$['xml:lang'].substring(0, 2);
						if (langs.has('1', shortLang)) {
							const lang = langs.where('1', shortLang);
							json.series[i].i18n[lang['2B']] = title._;
						} else {
							var serieName = xjat ? xjat : jaOfficial;
							console.log('Language unknown (' + title.$['xml:lang'] + ') for series ' + serieName);
						}
					}
				}
			}
		}
		if (!animeFound) {
			// Series not found in aniDB
			let serieName = json.series[i].name.replace(/ô/g, 'ou').replace(/û/g, 'uu').replace(/ä/g, 'a');
			console.log('WARNING : Series not found in aniDB : ' + serieName);
		}
	}
	await writeFile('out.json', JSON.stringify(json, null, 2), 'utf-8');
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