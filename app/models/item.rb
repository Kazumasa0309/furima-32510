class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category

  with_options presence: true do
    validates :user
    validates :name
    validates :explanation
    validates :category_id,       numericality: { other_than: 1 } 
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :price,             numericality: { :only_integer true,
                                                  :greater_than_or_equal_to 300,
                                                  :less_than_or_equal_to 9999999
                                                }
  end
end
