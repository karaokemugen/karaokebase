#!/usr/bin/env zx

// This script launches with zx, a small wrapper around Node
// https://github.com/google/zx

import {resolve} from 'path';

const tag = await question('TID to remove: ');
const role = await question('In which category: ', /*{
	choices: ['series', 'singers', 'songtypes', 'creators', 'langs', 'authors', 'misc', 'songwriters', 'groups', 'families', 'origins', 'genres', 'platforms', 'versions']
}*/);
const dir = await question('Path to karaokes/: ');

const files = await fs.readdir(dir);

console.log(tag, role, dir, files);

for (const name of files) {
	const file = await fs.readFile(resolve(dir, name), { encoding: 'utf-8' });
        let content = JSON.parse(file);
	if (content.data.tags[role] && content.data.tags[role].includes(tag)) {
		console.log(name);
		content.data.tags[role] = content.data.tags[role].filter(tid => tid !== tag);
		content.data.modified_at = new Date();
		await fs.writeFile(resolve(dir, name), JSON.stringify(content, null, 2), { encoding: 'utf-8' });
	}
}
