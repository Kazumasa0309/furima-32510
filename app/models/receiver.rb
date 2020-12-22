class Receiver < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :user
    validates :postal_code
    validates :name
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    # validates :building
    validates :phone_number
  end
end
