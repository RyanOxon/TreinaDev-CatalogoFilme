require 'rails_helper'

describe "User adds a movie on to watch list" do
  it "from movie details" do
    user = User.create!(email: 'user@user', password: '123456')
    UserProfile.create!(name: "user", age: 66, user: user)
    genre = Gender.create!(name: "Ficção Cientifica")
    director = Director.create!(name: "Christopher Nolan", nacionalidade: "Inglaterra", data_nascimento: "30/06/1970", gender: genre)
    movie = Movie.create!(title: "Interestelar", ano_de_lancamento: "2014", 
                            foi_lancado: true, 	duracao: 169, 	pais: "Estados Unidos", 
                            sinopse: "Um grupo de exploradores faz uso de um buraco de minhoca recém-descoberto para superar as limitações de viagens espaciais humanas e conquistar as grandes distâncias envolvidas em uma viagem interestelar.", 
                            director: director, gender: genre)

    login_as user, scope: :user
    visit root_path
    click_on movie.title

    expect(page).to have_content 'Interestelar'
    expect(page).to have_content 'Listas'
    expect(page).to have_button 'Adicionar Quero assistir'


  end
  it "sucessfully" do
    user = User.create!(email: 'user@user', password: '123456')
    UserProfile.create!(name: "user", age: 66, user: user)
    genre = Gender.create!(name: "Ficção Cientifica")
    director = Director.create!(name: "Christopher Nolan", nacionalidade: "Inglaterra", data_nascimento: "30/06/1970", gender: genre)
    movie = Movie.create!(title: "Interestelar", ano_de_lancamento: "2014", 
                            foi_lancado: true, 	duracao: 169, 	pais: "Estados Unidos", 
                            sinopse: "Um grupo de exploradores faz uso de um buraco de minhoca recém-descoberto para superar as limitações de viagens espaciais humanas e conquistar as grandes distâncias envolvidas em uma viagem interestelar.", 
                            director: director, gender: genre)
    login_as user, scope: :user
    
    visit movie_path(movie.id)
    click_on "Quero assistir"

    expect(page).to have_content "Adicionado a lista Quero assistir com sucesso"
    expect(page).to have_button 'Remover Quero assistir'

  end
end
