class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

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
    if params[:item][:image].present?
      if @item.update(item_params)
        redirect_to item_path(@item), notice: '商品情報を更新しました。'
      else
        render :edit, status: :unprocessable_entity
      end
    else
      # 画像が未入力の場合、既存の画像を保持して更新
      if @item.update(item_params.except(:image))
        redirect_to item_path(@item), notice: '商品情報を更新しました。'
      else
        render :edit, status: :unprocessable_entity
      end
    end
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
    redirect_to root_path unless current_user == @item.user
  end
end
