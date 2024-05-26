class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: %i[ show edit update ]
  before_action :authenticate_user!
  before_action :is_profile_owner?, only: %i[ show edit update ]

  def show
  end

  def new
    @user_profile = UserProfile.new()
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user = current_user
    if @user_profile.save
      redirect_to @user_profile, notice: "Perfil cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user_profile.update(user_profile_params)
      redirect_to @user_profile, notice: "Perfil atualizado com sucesso!"
    else
      render :edit
    end
  end

  private

  def is_profile_owner?
    unless user_signed_in? && @user_profile.user == current_user
      redirect_to root_path, notice: 'Você não pode acessar essa rota!'
    end
  end

  def user_profile_params
    params.require(:user_profile).permit(:age, :name, :country, :state, :city, :about, :profile_picture, :user_id)
  end

  def set_user_profile
    @user_profile = UserProfile.find(params[:id])
  end
end
