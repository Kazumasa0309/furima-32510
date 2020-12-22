class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :receiver

  with_options presence: true do
    validates :user
    validates :item
  end
end
