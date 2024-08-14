class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :desc) # 出品日時が新しい順に商品を取得
  end
end
