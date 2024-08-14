class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # 必要なロジックをここに追加
  end

  def new
    @item = Item.new
    @model = @item  
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new,status: :unprocessable_entity
    end
  end  
  
private


def item_params
  params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :shipping_days_id, :price)
end
end
