class CategorysController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = @category.items.order('created_at DESC')
  end
end
