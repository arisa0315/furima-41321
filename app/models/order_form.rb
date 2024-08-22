class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  # 必須項目のバリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" } # 都道府県が未選択の場合のエラーメッセージ
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
    validates :token
  end
  
  # カスタムバリデーション
  validate :user_cannot_order_own_item
  validate :item_not_sold_out

  # レコードの保存処理
  def save
    return false unless valid?

    # 購入情報の保存
    order = Order.create(user_id: user_id, item_id: item_id)

    # 住所情報の保存
    Address.create(
      postal_code: postal_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      address: address,
      building: building, 
      phone_number: phone_number, 
      order_id: order.id
    )
  end

  private

  # 自分が出品した商品は購入できないバリデーション
  def user_cannot_order_own_item
    item = Item.find(item_id)
    if item.user_id == user_id
      errors.add(:base, "You cannot order your own item")
    end
  end

  # 売却済みの商品は購入できないバリデーション
  def item_not_sold_out
    item = Item.find(item_id)
    if item.order.present? # sold_outメソッドより、orderの有無を確認
      errors.add(:base, "This item has already been sold")
    end
  end
end
