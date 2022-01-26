class Address < ApplicationRecord
  belongs_to :order
  validates :prefecture_id, presence: true
  validates :city, presence: true
end
