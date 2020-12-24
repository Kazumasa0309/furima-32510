class OrderReceiver
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :token

  with_options presence: true do
    # orderモデルのバリデーション
    # validates :user
    # validates :item
    # receiverモデルのバリデーション
    # validates :order
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    # validates :building
    validates :phone_number
  end

  def save
    # 注文の情報を保存し、「order」という変数に入れる
    order = Order.create(user_id: user_id, item_id: item_id)
    # 送付先の情報を保存
    Receiver.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number)
  end
end