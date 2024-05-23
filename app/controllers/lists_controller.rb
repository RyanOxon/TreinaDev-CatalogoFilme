class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def show; end

  private
  def set_list
    @list = List.find(params[:id])
  end
end