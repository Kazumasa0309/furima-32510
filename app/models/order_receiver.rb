class OrderReceiver
  include ActiveModel::Model
  attr_accessor :user, :item, :order, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user
    validates :item
    # receiverモデルのバリデーション
    validates :order
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    # validates :building
    validates :phone_number
  end

  def save
    # 注文の情報を保存し、「order」という変数に入れる
    order = Order.create(user: @item.user.id, item: @item.id)
    # 送付先の情報を保存
    Receiver.create(order: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number)
  end
end