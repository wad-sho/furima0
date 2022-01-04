class Tag < ApplicationRecord
  has_many :furima_tag_relations
  has_many :items, through: :furima_tag_relations
  validates :tag_name, uniqueness: true
end
