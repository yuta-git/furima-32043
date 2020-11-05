class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :price, :category_id, :condition_id, :delivery_charge_id, :delivery_day_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
