class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @order_receiver = OrderReceiver.new
    move_to_index
  end
 
  def create
    @order_receiver = OrderReceiver.new(order_params)
     if @order_receiver.valid?
       pay_item
       @order_receiver.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def order_params
   params.require(:order_receiver).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end
