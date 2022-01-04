class Item < ApplicationRecord
  belongs_to :wada
  has_one :order
  has_many :furima_tag_relations
  has_many :tags, through: :furima_tag_relations
  # Active_hashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  # <<アクティブストレージの設定関連>>
  has_many_attached :images

  # <<アソシエーション>>
  belongs_to :wada

  # <<バリデーション>>
  with_options presence: true do
    validates :name
    validates :info
    validates :price, numericality: { 
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9_999_999 }
  end

  # 金額の範囲
  # validates :price, numaricality:

  # ..:rubyの範囲オブジェクト　https://docs.ruby-lang.org/ja/latest/class/Range.html

  # numericalityを使うのもあります！
  # validates :price, numericality: { greater_than_or_equal_to: 300,
  #                                   less_than_or_equal_to: 9_999_999 }
  #

  # 選択関係で「---」のままになっていないか検証
  with_options presence: true, numericality: { other_than: 0 } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
  # validates :price, numericality: { only_integer: true,
  #                                   greater_than_or_equal_to: 300,
  #                                   less_than_or_equal_to: 9_999_999 }
end
