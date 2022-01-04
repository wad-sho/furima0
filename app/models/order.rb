class Order < ApplicationRecord
  belongs_to :wada
  belongs_to :item
  has_one :address
end
