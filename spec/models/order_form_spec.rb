require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @another_user)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe '購入機能' do
    context '購入がうまくいくとき' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@order_form).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空では購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が選択されていないと購入できない' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では購入できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下では購入できない' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '電話番号が12桁以上では購入できない' do
        @order_form.phone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '電話番号にハイフンが含まれていると購入できない' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'トークンが空では購入できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end

    context '購入ページへの遷移制限' do
      it 'ログアウト状態の場合は、購入ページに遷移できない（テスト内では確認できないため、この部分はコントローラで制御）' do
      end

      it 'ログイン状態であっても、自身が出品した商品の購入ページには遷移できない' do
        @item.user_id = @user.id  # 出品者を購入者と同じに設定
        @item.save  # 変更をデータベースに保存
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("You cannot order your own item")
      end
      
      it 'ログイン状態であっても、売却済みの商品の購入ページには遷移できない' do
        @item.order = FactoryBot.create(:order, item: @item, user: @another_user)
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("This item has already been sold")
      end
    end

    context 'エラーハンドリング' do
      it 'エラーメッセージが重複して表示されない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages.uniq.size).to eq(@order_form.errors.full_messages.size)
      end
      
      it '購入ページに戻った場合でも、入力済みの項目（カード番号・有効期限・セキュリティコード以外）は消えない' do
        @order_form.valid?
        expect(@order_form.postal_code).to eq("123-4567")
        expect(@order_form.prefecture_id).to eq(2)
        expect(@order_form.city).to eq("横浜市")
        expect(@order_form.address).to eq("青山1-1-1")
        expect(@order_form.building).to eq("柳ビル103")
        expect(@order_form.phone_number).to eq("09012345678")
      end
      
    end
  end
end
