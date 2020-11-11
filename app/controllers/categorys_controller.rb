class CategorysController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end
end
