const http = require('http');
const fs = require('fs');

//Test with raw file downloaded
//const raw = fs.readFileSync('./bakaclub.json', 'utf-8');
//parseBakaClubKaras(JSON.parse(raw));

http.get("https://kurisu.iiens.net/api_karas.php", response => {
	parseBakaClubKaras(JSON.parse(response.body));
});

async function parseBakaClubKaras(karas) {
	const newKaras = karas.filter(k => {
		const karaDate = new Date(k.author_year);
		const date = new Date(process.argv[2]);
		return karaDate >= date
	});
	for (const kara of newKaras) {
		await gitlabPostNewIssue(kara);
	}
}

async function gitlabPostNewIssue(kara) {
	const params = new URLSearchParams([
		['id', '2'],
		['title', `[Import Bakaclub] ${kara.language.toUpperCase()} - ${kara.source_name} - ${kara.song_type}${kara.song_number || ''} - ${kara.song_name}`],
		['description', `
		Download URL : https://kurisu.iiens.net/download.php?id=${kara.id}

		Auteur : ${kara.author_name}

		Catégorie : ${kara.category}

		`],
		['labels', 'à intégrer']
	]);
	const res = await http.post(`https://lab.shelter.moe/api/v4/projects/2/issues?${params.toString()}`, {
		headers: {
			'PRIVATE-TOKEN': 'i5WnabG3fvda4oxx-FRb'
		}
	});

	//console.log(params.toString());
}


