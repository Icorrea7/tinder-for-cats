class CatsController < ApplicationController
  before_action :require_cat, only: [:show, :destroy]
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

  def current_cat
    @cat = Cat.find_by(id: params[:id])
  end

  def require_cat
    if current_cat.blank?
      return render json: { message: "Cat not found" }, status: :not_found
    end
  end
end
