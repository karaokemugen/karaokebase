const { resolve } = require('path');
const { promisify } = require('util');
const { readFile, readdir, writeFileSync } = require('fs');
const axios = require('axios');

const PROJECT_ID = 32123952;
const DISCORD_HOOK = 'https://discord.com/api/webhooks/947965384382885988/';

const kpath = '../../karaokes';
const tpath = '../../tags';
const authors = [];
const contributors = [];
const newKaras = [];
let karaCount = -1;

const months = [
	['01', 'January'],
	['02', 'February'],
	['03', 'March'],
	['04', 'April'],
	['05', 'May'],
	['06', 'June'],
	['07', 'July'],
	['08', 'August'],
	['09', 'September'],
	['10', 'October'],
	['11', 'November'],
	['12', 'December']
];

const currentMonth = months[new Date().getMonth()];
const month = `${new Date().getFullYear()}-${currentMonth[0]}`;
const start = new Date(month);
const end = new Date(month + '-31 23:59:59');

const asyncReadFile = (...args) => passThroughFunction(readFile, args);
const asyncReadDir = (...args) => passThroughFunction(readdir, args);
const passThroughFunction = (fn, args) => {
	if (!Array.isArray(args)) args = [args];
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
	karaCount = dir.length;
	for (const file of dir) {
		const data = await asyncReadFile(resolve(kpath, file), 'utf-8');
		const kara = JSON.parse(data);
		kara.filename = file;
		const created_at = new Date(kara.data.created_at);
		if (!kara.data.tags.authors) kara.data.tags.authors = [];
		const author = [];
		kara.data.tags.authors.forEach(tid => {
			const singleAuthor = authors.find(a => a.tid === tid);
			singleAuthor ? author.push(singleAuthor.name) : author.push('Unknown');
		});
		if (created_at > start && created_at < end) {
			newKaras.push(
				`${kara.filename.replace('.kara.json', '').replaceAll('~', '\\~')} (${author.join(', ')})`
			);
			author.forEach(a => contributors.push(a));
		}
	}
}

async function genChangelog() {
	await readTags();
	await readKaras();
	const out = [];
	out.push(`Kara count: ${karaCount.toLocaleString('fr')}`, '', 'Contributors: ', '');
	contributors.sort();
	contributors
		.filter((item, index) => contributors.indexOf(item) === index && !['Karaoke Mugen', 'yt2ass'].includes(item))
		.forEach(c => out.push('- ' + c));
	out.push('', '## Added', '', 'New songs : ' + newKaras.length, '');
	newKaras.sort();
	newKaras.forEach(k => out.push('- ' + k));

	return out.join('\n');
}

async function main() {
	console.log('Generating changelog');

	const newChangelog = await genChangelog();

	const currentChangelog = (await axios.get(`https://gitlab.com/api/v4/projects/${PROJECT_ID}/repository/files/CHANGELOG.md/raw`, {
		headers: {'PRIVATE-TOKEN': process.env.GITLAB_TOKEN}
	})).data;

	const completedChangelog = `# ${currentMonth[1]} ${new Date().getFullYear()}

${newChangelog}

${currentChangelog}`;

	console.log('Pushing changelog');

	const fileUpdate = (await axios.put(`https://gitlab.com/api/v4/projects/${PROJECT_ID}/repository/files/CHANGELOG.md`, {
		branch: 'master',
		content: completedChangelog,
		commit_message: `🔖 New tag - ${currentMonth[1]} ${new Date().getFullYear()} - ${karaCount.toLocaleString('fr')} karas\n[skip-ci]`,
		author_name: 'Changelog Bot',
		author_email: 'mugen+changelogbot@karaokes.moe'
	}, {headers: {'PRIVATE-TOKEN': process.env.GITLAB_TOKEN}}));

	const tag = await axios.post(`https://gitlab.com/api/v4/projects/${PROJECT_ID}/releases`, {
		tag_name: `${new Date().getFullYear()}${currentMonth[0]}`,
		tag_message: `Kara count: ${karaCount.toLocaleString('fr')}`,
		ref: 'master',
		description: newChangelog
	}, {headers: {'PRIVATE-TOKEN': process.env.GITLAB_TOKEN}});

	console.log('Discord hook!');

	await axios.post(DISCORD_HOOK + process.env.DISCORD_TOKEN, {
		content: `<@85383511690706944> Le tag est créé !\n\n:microphone: On en est à **${karaCount.toLocaleString('fr')}** karaokés !\n\n:technologist: Contributeurs : ${contributors.filter((item, index) => contributors.indexOf(item) === index).join(', ')}`,
		embeds: null
	});
}

main();
