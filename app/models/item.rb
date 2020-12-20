class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_fee
    belongs_to :prefecture
    belongs_to :delivery_day

  with_options presence: true do
    validates :user
    validates :image
    validates :name,            length: { maximum: 40 }
    validates :explanation
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_day_id
    end
    validates :price,           numericality: { only_integer: true,
                                                greater_than_or_equal_to: 300,
                                                less_than_or_equal_to: 9999999
                                              }
  end
end
