class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  def index
    @movies = Movie.all
  end

  def show; end

  def new
    @directors = Director.all
    @genders = Gender.all
    @movie = Movie.new
  end

  def edit
    @directors = Director.all
    @genders = Gender.all
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movie_url(@movie), notice: "Filme criado com sucesso" 
    else
      render :new, alert: "Erro ao criar Filme: #{movie.errors.full_messages.join(', ')}" 
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to movie_url(@movie), notice: "Filme atualizado com sucesso" 
    else
      render :edit, alert: "Erro ao editar Filme: #{movie.errors.full_messages.join(', ')}" 
    end
  end

  def destroy
    @movie.destroy!
    redirect_to movies_url, notice: "Filme excluido com sucesso" 
  end

  private
  
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :ano_de_lancamento, :foi_lancado, :sinopse, :pais, :duracao, :picture, :director_id, :gender_id)
  end
end
