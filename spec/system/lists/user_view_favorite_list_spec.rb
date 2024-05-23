require 'rails_helper'

describe "User view his favorite list" do
  it "from user profile page" do
    user = User.create!(email: 'user@user', password: '123456')
    UserProfile.create!(name: "user", age: 66, user: user)
    genre = Gender.create!(name: "Ficção Cientifica")
    genre_1 = Gender.create!(name: "drama")

    director = Director.create!(name: "Christopher Nolan", nacionalidade: "Inglaterra", data_nascimento: "30/06/1970", gender: genre)
    movie = Movie.create!(title: "Interestelar", ano_de_lancamento: "2014", 
	                          foi_lancado: true, 	duracao: 169, 	pais: "Estados Unidos", 
	                          sinopse: "Um grupo de exploradores faz uso de um buraco de minhoca recém-descoberto para superar as limitações de viagens espaciais humanas e conquistar as grandes distâncias envolvidas em uma viagem interestelar.", 
	                          director: director, gender: genre)
    Movie.create!(title: "Oppenheimer", ano_de_lancamento: "2023",
                  foi_lancado: true, pais: "Estados Unidos", duracao: 180,
                  sinopse: "A vida do físico J. Robert Oppenheimer, que supervisionou o projeto Manhattan, que levou à criação da bomba atômica.",
                  director: director, gender: genre_1)
    MovieList.create!(list: user.lists.find_by(category: "favorite"), movie: movie)
    login_as user

    visit root_path
    within 'nav' do
      click_on "Meu Perfil"
    end
    click_on "Meus Favoritos"

    expect(page).to have_content "Lista de Favoritos"
    expect(page).to have_content "Interestelar"
    expect(page).not_to have_content "Oppenheimer"
  end
end
