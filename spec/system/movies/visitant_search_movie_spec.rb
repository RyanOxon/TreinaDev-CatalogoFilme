require 'rails_helper'

describe 'Visitant search movie' do
  it 'by name' do
    #arrange
    genre = Gender.create!(name: "Ficção Cientifica")
    genre_2 = Gender.create!(name: "Romance")
    director = Director.create!(
      name: "Christopher Nolan",
      nacionalidade: "Inglaterra",
      data_nascimento: "30/06/1970",
      gender: genre
    )
    Movie.create!(
      title: "Juno",
      ano_de_lancamento: "2010",
	    foi_lancado: true,
      duracao: 133,
      pais: "Estados Unidos",
      sinopse: "Muito Legal",
      director: director,
      gender: genre_2
    )
    Movie.create!(
      title: "Interstellar",
      ano_de_lancamento: "2014",
	    foi_lancado: true,
      duracao: 169,
      pais: "Estados Unidos",
      sinopse: "Um grupo de exploradores faz uso de um buraco de minhoca recém-descoberto para superar as limitações de viagens espaciais humanas e conquistar as grandes distâncias envolvidas em uma viagem interestelar.",
      director: director,
      gender: genre
    )
    #act
    visit root_path
    within("div#search") do
      fill_in "Procurar filme...",	with: "inter"
      click_on "Procurar"
    end
    #assert
    within("div#movie-0") do
      expect(page).to have_content("Interstellar")
    end
  end
end
