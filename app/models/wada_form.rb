class WadaForm
  include ActiveModel::Model
  # モデルと同様にヘルパーメソッド使えるようになるよ

  attr_accessor :token, :wada_id, :item_id, :prefecture_id, :postal_code, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :phone_number
    validates :token
    validates :wada_id
    validates :item_id
  end

  def save
    order = Order.create(
      item_id: item_id,
      wada_id: wada_id
    )
    Address.create(
      order_id: order.id,
      prefecture_id: prefecture_id,
      postal_code: postal_code,
      city: city,
      building: building,
      address: address,
      phone_number: phone_number
    )
  end
end
