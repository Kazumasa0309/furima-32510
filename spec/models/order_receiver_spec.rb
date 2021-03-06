require 'rails_helper'

RSpec.describe OrderReceiver, type: :model do
  before do
    @user = FactoryBot.create(:user)  # userのインスタンス生成
    @item = FactoryBot.create(:item)  # itemのインスタンス生成
    @order_receiver = FactoryBot.build(:order_receiver, user_id: @user.id , item_id: @item.id)  # order_receiverのインスタンス生成
    sleep 1
  end

  describe '商品購入機能' do
    context '商品購入:成功パターン' do
      it 'FactoryBotの内容通りならば新規登録できる' do
        expect(@order_receiver).to be_valid
      end

      it 'buildingが空でも新規登録できる' do
        @order_receiver.building = nil
        expect(@order_receiver).to be_valid
      end
    end

    context '商品購入:失敗パターン' do
      it 'token:空パターン' do
        @order_receiver.token = nil
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_id:空パターン' do
        @order_receiver.user_id = nil
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("User can't be blank")
      end

      it 'item_id:空パターン' do
        @order_receiver.item_id = nil
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_code:空パターン' do
        @order_receiver.postal_code = nil
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_code:ハイフン落ちパターン' do
        @order_receiver.postal_code = "1200000"
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_code:桁数不整合パターン' do
        @order_receiver.postal_code = "1200-000"
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_id:空パターン' do
        @order_receiver.prefecture_id = nil
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_id:1パターン(未選択)' do
        @order_receiver.prefecture_id = 1
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'municipality:空パターン' do
        @order_receiver.municipality = nil
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'address:空パターン' do
        @order_receiver.address = nil
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_number:空パターン' do
        @order_receiver.phone_number = nil
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_number:11桁オーバーパターン' do
        @order_receiver.phone_number = "090123456789"
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_number:英数字混合パターン' do
        @order_receiver.phone_number = "090aaaa56789"
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end