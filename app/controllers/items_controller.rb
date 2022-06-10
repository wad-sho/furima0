class ItemsController < ApplicationController
  before_action :authenticate_wada!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
 
   
  end

  def new
    @item = ItemsTag.new
  end

  def create
    
    @item = ItemsTag.new(item_params)
    @item.price = item_params[:price].to_i
    #     また、入力した商品情報がバリデーションを通過しなかった場合、再度「商品出品ページ」が表示されるように実装しましょう。
    # バリデーション通過の可否を条件に処理を分岐させ、エラーメッセージが表示されるように適切なメソッドを用いて記述してください。
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    if @item.wada == current_wada
      @item.destroy
      redirect_to root_path
    end

    
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
       binding.pry
    return redirect_to root_path if @item.order
    
  end
  private

  def item_params
    params.require(:items_tag).permit(
      :image,
      :name,
      :info,
      :category_id,
      :sales_status_id,
      :shipping_fee_status_id,
      :prefecture_id,
      :scheduled_delivery_id,
      :price,
      :tag_name,
      { images: [] }
    ).merge(wada_id: current_wada.id)
    # ストロングパラメーターの設定も受講生によって名前が異なります。
    # ActiveHashの設定を確認しましょう。
  end
end
