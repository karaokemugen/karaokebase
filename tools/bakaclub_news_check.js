const fs = require('fs');
const request = require('request');
//Test with raw file downloaded
//const raw = fs.readFileSync('./bakaclub.json', 'utf-8');
//parseBakaClubKaras(JSON.parse(raw));

request('https://kurisu.iiens.net/api', (error, response, body) => {
        if (!error) {
                //console.log(JSON.stringify(JSON.parse(body), null, 2));
                parseBakaClubKaras(JSON.parse(body));
        } else {
                console.log(error);
        }
});

async function parseBakaClubKaras(karas) {
        const newKaras = karas.filter(k => k.author_year >= (process.argv[2] + ' 00:00:00'));
        for (const kara of newKaras) {
                try {
                        await gitlabPostNewIssue(kara);
                } catch(err) {
                        // Do nothing.
                }
        }
}

async function gitlabPostNewIssue(kara) {
        const params = new URLSearchParams([
                ['id', '2'],
                ['title', `[Import Bakaclub] ${kara.language.toUpperCase()} - ${kara.source_name} - ${kara.song_type}${kara.song_number || ''} - ${kara.song_name}`],
                ['description', `
Download URL : https://kurisu.iiens.net/api/download/${kara.id}

Auteur : ${kara.author_name}

Catégorie : ${kara.category}

Commentaire :
` + kara.upload_comment ? `${kara.upload_comment}` : ''],
		['labels', 'à intégrer']
	]);
	return new Promise((resolve, reject) => {
		console.log(kara.author_year, kara.source_name, kara.song_name);
		request.post(`https://lab.shelter.moe/api/v4/projects/2/issues?${params.toString()}`, {
			headers: {
				'PRIVATE-TOKEN': 'i5WnabG3fvda4oxx-FRb'
			}
		}, (err) => {
			if (err) {
				console.log(err);
				reject();
			} else {
				resolve();
			}
		});
	});
}
