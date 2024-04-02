class DirectorsController < ApplicationController
  before_action :set_director, only: %i[ show edit update destroy ]

  def index
    @directors = Director.all
  end

  def show; end

  def new
    @genders = Gender.all
    @director = Director.new
  end

  def edit
    @genders = Gender.all
  end

  def create
    @director = Director.new(director_params)

    if @director.save
      redirect_to director_url(@director), notice: "Diretor criado com sucesso"
    else
      render :new, alert: "Erro ao criar diretor: #{director.errors.full_messages.join(', ')}" 
    end
  end

  def update
    if @director.update(director_params)
      redirect_to director_url(@director), notice: "Diretor atualizado com sucesso" 
    else
      render :edit, alert: "Erro ao editar diretor #{director.erros.full_messages.join(', ')}"
    end
  end

  def destroy
    @director.destroy!
    redirect_to directors_url, notice: "Diretor excluido com sucesso"
  end

  private
    def set_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.require(:director).permit(:name, :nacionalidade, :data_nascimento, :gender_id)
    end
end
