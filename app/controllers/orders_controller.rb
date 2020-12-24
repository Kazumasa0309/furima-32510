class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_receiver = OrderReceiver.new
  end
 
  def create
    @item = Item.find(params[:item_id])
    @order_receiver = OrderReceiver.new(order_params)
     if @order_receiver.valid?
       pay_item
       @order_receiver.save
       redirect_to action: :index
     else
       @item = Item.find(params[:item_id])
       render action: :index
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def order_params
   params.require(:order_receiver).permit(:order, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

end
