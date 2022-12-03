class CatsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
  end

  def new
  end

  def create
    @cat = Cat.new(cats_params)
    @cat.save
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
