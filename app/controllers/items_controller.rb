class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品情報を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path, notice: '商品を削除しました。'
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id,
                                 :condition_id, :shipping_fee_burden_id,
                                 :prefecture_id, :shipping_days_id, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    # 現在のユーザーが出品者でない場合、または商品が売却済みの場合にリダイレクト
    if current_user != @item.user || @item.sold_out?
      redirect_to root_path
    end
  end
end
