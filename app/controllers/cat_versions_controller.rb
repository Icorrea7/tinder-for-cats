class CatVersionsController < ApplicationController
  def show
    @versions = CatVersion.where(cat_id: params[:id])

    if @versions.blank?
      return render json: { message: "Cat not found" }, status: :not_found
    end
  end
end