class GendersController < ApplicationController
  before_action :set_gender, only: %i[ show edit update destroy ]

  def index
    @genders = Gender.all
  end

  def show; end

  def new
    @gender = Gender.new
  end

  def edit; end

  def create
    @gender = Gender.new(gender_params)
    if @gender.save
      redirect_to gender_url(@gender), notice: "Genero criado com sucesso"
    else
      render :new, alert: "Erro ao criar genero: #{gender.errors.full_messages.join(', ')}"  
    end
  end

  def update
    if @gender.update(gender_params)
      redirect_to gender_url(@gender), notice: "Genero atualizado com sucesso"
    else
      render :edit, alert: "Erro ao editar Genero: #{gender.errors.full_messages.join(', ')}"  
    end
  end

  def destroy
    @gender.destroy!
    redirect_to genders_url, notice: "Genero excluido com sucesso" 
  end

  private

  def set_gender
    @gender = Gender.find(params[:id])
  end

  def gender_params
    params.require(:gender).permit(:name)
  end
end
