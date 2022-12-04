class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @cats = Cat.all
  end

  def show
  end

  def new
  end

  def create
    @cat = Cat.new(cats_params)
    @cat.save

    redirect_to cats_path
  end

  def destroy
    @cat.destroy

    redirect_to cats_path
  end

  private
  def cats_params
    params.permit(
      :id,
      :name,
      :last_name,
      :email,
      :phone,
      :status,
      :avatar
    )
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end
end
