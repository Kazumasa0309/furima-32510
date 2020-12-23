class OrderReceiver
  include ActiveModel::Model
  attr_accessor :user, :item, :order, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number
end