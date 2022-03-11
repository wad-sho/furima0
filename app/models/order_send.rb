class OrderSend
  include ActiveModel::Model
  # Active Recordの場合と同様に form_with や render などのヘルパーメソッドが使用できるようになる

  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :wada_id, :item_id, :token

  # フォームオブジェクトで使用する値を定義している（読み書きができるようになっている）

  # <<バリデーション>>
  #  , numericality: { other_than: 0 }
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { only_integer: true,
                                              greater_than_or_equal_to: 1,
                                              less_than_or_equal_to: 10 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :wada_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(
      # 保存した情報を変数orderにいれる
      item_id: item_id,
      wada_id: wada_id
    )
    Address.create(
      order_id: order.id,
      # 保存された情報を持つ変数orderから、idだけを取り出し、order_idとして保存を行う
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number
    )
  end
end
