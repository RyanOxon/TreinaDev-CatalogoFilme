require 'rails_helper'

describe "requests for movie" do
  context "favorite" do
    it "must be authenticated" do
      genre = Gender.create!(name: "Ficção Cientifica")
      director = Director.create!(name: "Christopher Nolan", nacionalidade: "Inglaterra", data_nascimento: "30/06/1970", gender: genre)
      movie = Movie.create!(title: "Interestelar", ano_de_lancamento: "2014", 
                              foi_lancado: true, 	duracao: 169, 	pais: "Estados Unidos", 
                              sinopse: "Um grupo de exploradores faz uso de um buraco de minhoca recém-descoberto para superar as limitações de viagens espaciais humanas e conquistar as grandes distâncias envolvidas em uma viagem interestelar.", 
                              director: director, gender: genre)
  
      post favorite_movie_path(movie.id)

      expect(response).to redirect_to new_user_session_path 
    end
  end
end
