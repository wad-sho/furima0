class ItemsTag
  include ActiveModel::Model
  ## ItemFormクラスのオブジェクトがitemモデルの属性を扱えるようにする
  attr_accessor(
                :name, :info, :category_id, :sales_status_id,
                :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id,
                :price,
                :images,
                :wada_id,
                :tag_name
               )

  # <<バリデーション（ほぼitem.rbの流用）>>

  # 値が入っているか検証
  with_options presence: true do
    validates :images
    validates :name
    validates :info
    validates :price

  end

  # 金額が半角であるか検証
  validates :price, numericality: { only_integer: true, message: 'Half-width number' }

  # 金額の範囲
  # validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'
  validates :price, presence: true, inclusion: { in: 300..9_999_999, message: 'is invalid. Input half-width characters. Price is out of setting range' }
  def save
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    item = Item.new(
      name: name,
      info: info,
      price: price,
      category_id: category_id,
      sales_status_id: sales_status_id,
      shipping_fee_status_id: shipping_fee_status_id,
      prefecture_id: prefecture_id,
      scheduled_delivery_id: scheduled_delivery_id,
      wada_id: wada_id,
      images: images)
      
  
    item.save

  end

end