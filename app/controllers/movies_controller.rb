class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy remove_list add_list]
  before_action :authenticate_user!, only: %i[ add_list remove_list ]

  def remove_list
    @list = List.find_by(category: params[:list])
    #unless list.user == current_user
    #  return redirect_to root_path, alert: 'Não autorizado'
    #end
    movie_list = @list.movie_lists.find_by(movie_id: @movie.id)
    if movie_list.destroy
      redirect_to request.referer, notice: "Removido de #{@list.humanized_category_name} com sucesso"
    else
      render @list
    end
  end

  def add_list
    @user = current_user
    list = @user.lists.find_by(category: params[:list])
    movie_list = MovieList.new(list: list, movie: @movie)
    if movie_list.save
      redirect_to @movie, notice: "Adicionado a lista #{list.humanized_category_name} com sucesso"
    else
      flash.now[:alert] = "Erro ao adiconar aos favoritos"
      render @movie
    end
  end

  def index
    if params[:query].present?
      @query = params[:query]
      return @movies = Movie.joins(:director).where("title LIKE ? OR name LIKE ?", "%#{@query}%", "%#{@query}%")
    end
    if params[:filter].present?
      return @movies = control_filters
    end
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

  def control_filters()
    filter = params[:filter]

    if filter == "AZ"
      return Movie.all.order(:title)
    end

    if filter == "ZA"
      return Movie.all.order(title: :desc)
    end

    if filter == "Data de lançamento"
      return Movie.all.order(Arel.sql('CAST(ano_de_lancamento AS INTEGER) DESC'))
    end

    if filter.split("-")[0] == "Gênero"
      return Movie.all.filter {|movie| movie.gender.name == filter.split("-")[1]}
    end
  end
end
