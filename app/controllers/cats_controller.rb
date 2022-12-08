class CatsController < ApplicationController
  before_action :require_cat, only: [:show, :destroy, :update, :edit]

  def index
    @cats = Cat.all
  end

  def show
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cats_params)
    @cat.save

    redirect_to cats_path
  end

  def edit
  end

  def update
    @cat.update(cats_params)
    redirect_to cat_path(@cat.id)
  end

  def destroy
    @cat.destroy

    redirect_to cats_path
  end

  private

  def cats_params
    params.require(:cat).permit(
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
