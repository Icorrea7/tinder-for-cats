class CatsController < ApplicationController
  def index
  end

  def show
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
      images: []
    )
  end
end
