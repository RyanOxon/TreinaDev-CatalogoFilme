require 'rails_helper'

describe "User removes a movie from list" do
  context "#Favorite" do
    it "from movie detail" do
      user = User.create!(email: 'user@user', password: '123456')
      UserProfile.create!(name: "user", age: 66, user: user)
      genre = Gender.create!(name: "Ficção Cientifica")
      genre_1 = Gender.create!(name: "drama")
  
      director = Director.create!(name: "Christopher Nolan", nacionalidade: "Inglaterra", data_nascimento: "30/06/1970", gender: genre)
      movie = Movie.create!(title: "Interestelar", ano_de_lancamento: "2014", 
                              foi_lancado: true, 	duracao: 169, 	pais: "Estados Unidos", 
                              sinopse: "Um grupo de exploradores faz uso de um buraco de minhoca recém-descoberto para superar as limitações de viagens espaciais humanas e conquistar as grandes distâncias envolvidas em uma viagem interestelar.", 
                              director: director, gender: genre)
      MovieList.create!(list: user.lists.find_by(category: "favorite"), movie: movie)
      login_as user

      visit movie_path(movie.id)

      click_on "Remover Favoritos"

      expect(page).to have_content "Removido de Favoritos com sucesso"
      expect(page).not_to have_button "Remover Favoritos"
      expect(page).to have_button "Adicionar Favoritos"
  
      
    end

    it "from favorite list" do
      user = User.create!(email: 'user@user', password: '123456')
      UserProfile.create!(name: "user", age: 66, user: user)
      genre = Gender.create!(name: "Ficção Cientifica")
      genre_1 = Gender.create!(name: "drama")

      director = Director.create!(name: "Christopher Nolan", nacionalidade: "Inglaterra", data_nascimento: "30/06/1970", gender: genre)
      movie = Movie.create!(title: "Interestelar", ano_de_lancamento: "2014", 
                              foi_lancado: true, 	duracao: 169, 	pais: "Estados Unidos", 
                              sinopse: "Um grupo de exploradores faz uso de um buraco de minhoca recém-descoberto para superar as limitações de viagens espaciais humanas e conquistar as grandes distâncias envolvidas em uma viagem interestelar.", 
                              director: director, gender: genre)
      movie_1 = Movie.create!(title: "Oppenheimer", ano_de_lancamento: "2023",
                    foi_lancado: true, pais: "Estados Unidos", duracao: 180,
                    sinopse: "A vida do físico J. Robert Oppenheimer, que supervisionou o projeto Manhattan, que levou à criação da bomba atômica.",
                    director: director, gender: genre_1)
      MovieList.create!(list: user.lists.find_by(category: "favorite"), movie: movie)
      MovieList.create!(list: user.lists.find_by(category: "favorite"), movie: movie_1)

      login_as user

      visit user_profile_list_path(user.user_profile, user.find_list("favorite").id)
      
      within 'div#movie-0' do
        click_on 'Remover'
      end

      expect(page).to have_content 'Removido de Favoritos com sucesso'
      expect(page).not_to have_content 'Interestelar'
      expect(page).to have_content 'Oppenheimer'
    end
    
  end
  context "#To watch" do
    it "from movie detail" do
      user = User.create!(email: 'user@user', password: '123456')
      UserProfile.create!(name: "user", age: 66, user: user)
      genre = Gender.create!(name: "Ficção Cientifica")
      genre_1 = Gender.create!(name: "drama")

      director = Director.create!(name: "Christopher Nolan", nacionalidade: "Inglaterra", data_nascimento: "30/06/1970", gender: genre)
      movie = Movie.create!(title: "Interestelar", ano_de_lancamento: "2014", 
                              foi_lancado: true, 	duracao: 169, 	pais: "Estados Unidos", 
                              sinopse: "Um grupo de exploradores faz uso de um buraco de minhoca recém-descoberto para superar as limitações de viagens espaciais humanas e conquistar as grandes distâncias envolvidas em uma viagem interestelar.", 
                              director: director, gender: genre)
      MovieList.create!(list: user.lists.find_by(category: "to_watch"), movie: movie)
      login_as user

      visit movie_path(movie.id)

      click_on "Remover Quero assistir"

      expect(page).to have_content "Removido de Quero assistir com sucesso"
      expect(page).not_to have_button "Remover Quero assistir"
      expect(page).to have_button "Adicionar Quero assistir"

      
    end

    it "from favorite list" do
      user = User.create!(email: 'user@user', password: '123456')
      UserProfile.create!(name: "user", age: 66, user: user)
      genre = Gender.create!(name: "Ficção Cientifica")
      genre_1 = Gender.create!(name: "drama")

      director = Director.create!(name: "Christopher Nolan", nacionalidade: "Inglaterra", data_nascimento: "30/06/1970", gender: genre)
      movie = Movie.create!(title: "Interestelar", ano_de_lancamento: "2014", 
                              foi_lancado: true, 	duracao: 169, 	pais: "Estados Unidos", 
                              sinopse: "Um grupo de exploradores faz uso de um buraco de minhoca recém-descoberto para superar as limitações de viagens espaciais humanas e conquistar as grandes distâncias envolvidas em uma viagem interestelar.", 
                              director: director, gender: genre)
      movie_1 = Movie.create!(title: "Oppenheimer", ano_de_lancamento: "2023",
                    foi_lancado: true, pais: "Estados Unidos", duracao: 180,
                    sinopse: "A vida do físico J. Robert Oppenheimer, que supervisionou o projeto Manhattan, que levou à criação da bomba atômica.",
                    director: director, gender: genre_1)
      MovieList.create!(list: user.lists.find_by(category: "to_watch"), movie: movie)
      MovieList.create!(list: user.lists.find_by(category: "to_watch"), movie: movie_1)

      login_as user

      visit user_profile_list_path(user.user_profile, user.find_list("to_watch").id)
      
      within 'div#movie-0' do
        click_on 'Remover'
      end

      expect(page).to have_content 'Removido de Quero assistir com sucesso'
      expect(page).not_to have_content 'Interestelar'
      expect(page).to have_content 'Oppenheimer'
    end
    
  end
  
end
