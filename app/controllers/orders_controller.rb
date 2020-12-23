class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_receiver = OrderReceiver.new
  end
 
  def create
    @order_receiver = OrderReceiver.new(order_params)
    # binding.pry
     if @order_receiver.valid?
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
   params.require(:order_receiver).permit(:user, :item, :order, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number)
  end
end
