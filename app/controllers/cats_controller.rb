class CatsController < ApplicationController
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
  end

  def destroy
    @cat = Cat.find(params[:id])
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
end
