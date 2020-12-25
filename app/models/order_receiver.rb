class OrderReceiver
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :token

  with_options presence: true do
    # tokenのバリデーション
    validates :token
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # receiverモデルのバリデーション
    validates :postal_code,   format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number,  format: { with: /\A\d{,11}\z/ }
  end

  def save
    # 注文の情報を保存し、「order」という変数に入れる
    order = Order.create(user_id: user_id, item_id: item_id)
    # 送付先の情報を保存
    Receiver.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number)
  end
end