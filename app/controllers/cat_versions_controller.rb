class CatVersionsController < ApplicationController
  def show
    @versions = CatVersion.where(cat_id: params[:id])
  end
end