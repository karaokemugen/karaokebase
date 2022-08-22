const axios = require('axios');
const { resolve } = require('node:path');
const { readFile, writeFile, readdir } = require('node:fs/promises');

const tagPath = process.argv[2];

const notFound = [];
const unclear = [];

async function main() {
    const tags = await readdir(tagPath);
    for (const tag of tags) {
        const filePath = resolve(tagPath, tag);
        const tagContents = JSON.parse(await readFile(filePath));
        let response = null;
        if (tagContents.tag.external_database_ids?.kitsu) continue;
        if (tagContents.tag.external_database_ids?.myanimelist) {
            response = await axios.get('https://kitsu.io/api/edge/mappings', {
                params: {
                    'filter[external_site]': 'myanimelist/anime',
                    'filter[external_id]': tagContents.tag.external_database_ids.myanimelist,
                    'include': 'item',
                    'fields[anime]': 'id'
                }
            });
            if (response.data.meta.count === 0) response = null; // Clear response to try AniList
        }
        if (response === null && tagContents.tag.external_database_ids?.anilist) {
            response = await axios.get('https://kitsu.io/api/edge/mappings', {
                params: {
                    'filter[external_site]': 'anilist/anime',
                    'filter[external_id]': tagContents.tag.external_database_ids.anilist,
                    'include': 'item',
                    'fields[anime]': 'id'
                }
            });
        }
        if (response) {
            if (response.data.meta.count === 1) {
                const kitsuID = response.data.data[0].relationships.item.data.id;
                tagContents.tag.external_database_ids.kitsu = parseInt(kitsuID);
                writeFile(filePath, JSON.stringify(tagContents, null, 2), 'utf8');
                console.log(`Processed ${tagContents.tag.name} (${response.data.data[0].attributes.externalSite} ${tagContents.tag.external_database_ids.myanimelist} -> kitsu/anime ${kitsuID})`);
            } else if (response.data.meta.count > 1) {
                unclear.push({
                    tag,
                    response: response.data
                });
            } else {
                notFound.push(tag);
            }
        }
    }
    await writeFile(resolve(__dirname, 'unclear.json'), JSON.stringify(unclear, null, 2));
    await writeFile(resolve(__dirname, 'not_found.json'), JSON.stringify(notFound, null, 2));
    console.log('Done!');
}

main();