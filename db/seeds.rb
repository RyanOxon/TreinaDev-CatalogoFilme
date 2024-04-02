["Ação", "Comédia", "Drama", "Terror", "Infantil", "Ficção Cientifica", "Fantasia"].each do |genre_name|
	Gender.find_or_create_by!(name: genre_name)
end

Director.find_or_create_by!(name: "Christopher Nolan", nacionalidade: "Inglaterra", data_nascimento: "30/06/1970", gender_id: Gender.find_by(name: "Ficção Cientifica").id)
Director.find_or_create_by!(name: "Martin Scorsese", nacionalidade: "Estados Unidos", data_nascimento: "17/11/1942", gender_id: Gender.find_by(name: "Drama").id)	
Director.find_or_create_by!(name: "David Fincher", nacionalidade: "Estados Unidos", data_nascimento: "28/08/1962", gender_id: Gender.find_by(name: "Ação").id)
Director.find_or_create_by!(name: "Tim Burton", nacionalidade: "Estados Unidos", data_nascimento: "25/08/1958", gender_id: Gender.find_by(name: "Fantasia").id)

Movie.find_or_create_by!(title: "Interestelar", 
	ano_de_lancamento: "2014", 
	foi_lancado: true, 
	sinopse: "Um grupo de exploradores faz uso de um buraco de minhoca recém-descoberto para superar as limitações de viagens espaciais humanas e conquistar as grandes distâncias envolvidas em uma viagem interestelar.", 
	pais: "Estados Unidos", 
	duracao: 169, 
	director_id: Director.find_by(name: "Christopher Nolan").id, 
	gender_id: Gender.find_by(name: "Ficção Cientifica").id)

Movie.find_or_create_by!(title: "O Lobo de Wall Street",
	ano_de_lancamento: "2013",
	foi_lancado: true,
	sinopse: "Durante seis meses, Jordan Belfort (Leonardo DiCaprio) trabalhou duro em uma corretora de Wall Street, seguindo os ensinamentos de seu mentor Mark Hanna (Matthew McConaughey). Quando finalmente consegue ser contratado como corretor da firma, acontece o Black Monday, que faz com que as bolsas de vários países caiam repentinamente. Sem emprego e bastante ambicioso, ele acaba trabalhando para uma empresa de fundo de quintal que lida com papéis de baixo valor, que não estão na bolsa de valores. É lá que Belfort tem a ideia de montar uma empresa focada neste tipo de negócio, cujas vendas são de valores mais baixos mas, em compensação, o retorno para o corretor é bem mais vantajoso. Ao lado de Donnie (Jonah Hill) e outros amigos dos velhos tempos, ele cria a Stratton Oakmont, uma empresa que faz com que todos enriqueçam rapidamente e, também, levem uma vida dedicada ao prazer.",
	pais: "Estados Unidos",
	duracao: 180,
	director_id: Director.find_by(name: "Martin Scorsese").id,
	gender_id: Gender.find_by(name: "Drama").id)

Movie.find_or_create_by!(title: "Clube da Luta",
	ano_de_lancamento: "1999",
	foi_lancado: true,
	sinopse: "Jack (Edward Norton) é um executivo jovem, trabalha como investigador de seguros, mora confortavelmente, mas ele está ficando cada vez mais insatisfeito com sua vida medíocre. Para piorar ele está enfrentando uma terrível crise de insônia, até que encontra uma cura inusitada para o sua falta de sono ao frequentar grupos de auto-ajuda. Nesses encontros ele encontra pessoas que como ele estão buscando auto-ajuda e autoconhecimento. É lá que ele conhece Marla Singer (Helena Bonham Carter), com quem passa a conviver.",
	pais: "Estados Unidos",
	duracao: 139,
	director_id: Director.find_by(name: "David Fincher").id,
	gender_id: Gender.find_by(name: "Ação").id)

Movie.find_or_create_by!(title: "O Poderoso Chefão",
	ano_de_lancamento: "1972",
	foi_lancado: true,
	sinopse: "Don Vito Corleone (Marlon Brando) é o chefe de uma 'família' de Nova York que está feliz, pois Connie (Talia Shire), sua filha, se casou com Carlo (Gianni Russo). Porém, durante a festa, Bonasera (Salvatore Corsitto) é visto no escritório de Don Corleone pedindo 'justiça', vingança na verdade contra membros de uma quadrilha, que espancaram barbaramente sua filha por ela ter se recusado a fazer sexo para preservar a honra. Vito discute, mas os argumentos de Bonasera o sensibilizam, fazendo com que prometa que os homens, que maltrataram a filha de Bonasera não serão mortos. Vito porém deixa claro que ele pode chamar Bonasera algum dia para devolver o favor. Vito é respeitado e temido por todos, é auxiliado por Tom Hagen (Robert Duvall), seu filho adotivo. Santino (James Caan) é seu filho mais velho e herdeiro do cargo, Freddie (John Cazale) é o filho mais fraco e Michael (Al Pacino) é um herói de guerra e estudante de Direito, que não quer envolvimento nos negócios da família, mas acaba sendo tragado pelo destino.",
	pais: "Estados Unidos",
	duracao: 175,
	director_id: Director.find_by(name: "Martin Scorsese").id,
	gender_id: Gender.find_by(name: "Drama").id)

Movie.find_or_create_by!(title: "Oppenheimer",
	ano_de_lancamento: "2023",
	foi_lancado: true,
	sinopse: "A vida do físico J. Robert Oppenheimer, que supervisionou o projeto Manhattan, que levou à criação da bomba atômica.",
	pais: "Estados Unidos",
	duracao: 180,
	director_id: Director.find_by(name: "Christopher Nolan").id,
	gender_id: Gender.find_by(name: "Drama").id)

Movie.find_or_create_by!(title: "Bettlejuice 2",
	ano_de_lancamento: "2024",
	foi_lancado: false,
	sinopse: "Beetlejuice 2 é um futuro filme de comédia de fantasia americano dirigido por Tim Burton com roteiro de Alfred Gough e Miles Millar, baseado em uma história de Seth Grahame-Smith",
	pais: "Estados Unidos",
	duracao: 0,
	director_id: Director.find_by(name: "Tim Burton").id,
	gender_id: Gender.find_by(name: "Comédia").id)

Movie.find_by(title: "Interestelar").picture.attach(io: File.open("app/assets/images/Interestelar.jpeg"), filename: "Interestelar.jpeg")
Movie.find_by(title: "O Lobo de Wall Street").picture.attach(io: File.open("app/assets/images/Wallstreet.jpeg"), filename: "Wallstreet.jpeg")
Movie.find_by(title: "Clube da Luta").picture.attach(io: File.open("app/assets/images/ClubeDaLuta.jpeg"), filename: "ClubeDaLuta.jpeg")
Movie.find_by(title: "O Poderoso Chefão").picture.attach(io: File.open("app/assets/images/PoderosoChefao.jpeg"), filename: "PoderosoChefao.jpeg")
Movie.find_by(title: "Oppenheimer").picture.attach(io: File.open("app/assets/images/Oppenheimer.jpeg"), filename: "Oppenheimer.jpeg")
Movie.find_by(title: "Bettlejuice 2").picture.attach(io: File.open("app/assets/images/Beetlejuice2.jpg"), filename: "Beetlejuice2.jpg")
