class OrdersController < ApplicationController
  before_action :set_purehase, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    # ネスト構造でないとこの書き方ができない
    @wada = PayForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @wada = PayForm.new(order_params)
    if @wada.valid?
      paypay
      @wada.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def paypay
    Payjp.api_key = ENV['PAYJP_SK']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  private

  def order_params
    params.require(:pay_form).permit(:postal_code, :prefecture_id, :address, :city, :building, :phone_number).merge(
      wada_id: current_wada.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_purehase
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end
end
