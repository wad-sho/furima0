# require 'rails_helper'

# RSpec.describe Item, type: :model do
#   before do
#     @item = FactoryBot.build(:item)
#   end
#   describe '商品作成' do
#     context '正常に保存ができる場合' do
#       it '全ての情報が正しく入っていれば、保存ができる' do
#         expect(@item).to be_valid
#       end
#     end
#     context '正常に保存ができない場合' do
#       it 'imageがないと保存ができない' do
#         @item.image = nil
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Image can't be blank")
#       end
#       it 'nameがないと保存ができない' do
#         @item.name = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Name can't be blank")
#       end
#       it 'infoがないと保存ができない' do
#         @item.info = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Info can't be blank")
#       end
#       it 'priceがないと保存ができない' do
#         @item.price = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Price can't be blank")
#       end
#       it 'priceが299円以下だと保存ができない' do
#         @item.price = '3'
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Price is not included in the list")
#       end
#       it 'priceが10,000,000円以上だと保存ができない' do
#         @item.price = 10000000
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Price is not included in the list")
#       end
#       it 'priceが全角だと保存ができない' do
#         @item.price = '１０００'
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Price is not included in the list")
#       end
#       it 'priceが文字だと保存ができない' do
#         @item.price = "abc"
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Price is not included in the list")
#       end
#       it 'category_idが0を選ばれていると保存ができない' do
#         @item.category_id = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Category must be other than 0")
#       end
#       it 'category_idがないと保存ができない' do
#         @item.category_id = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Category can't be blank")
#       end
#       it 'sales_status_idが0を選ばれていると保存ができない' do
#         @item.sales_status_id = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Sales status must be other than 0")
#       end
#       it 'sales_status_idがないと保存ができない' do
#         @item.sales_status_id = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Sales status can't be blank")
#       end
#       it 'shipping_fee_status_idが0を選ばれていると保存ができない' do
#         @item.shipping_fee_status_id = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Shipping fee status must be other than 0")
#       end
#       it 'shipping_fee_status_idがないと保存ができない' do
#         @item.shipping_fee_status_id = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
#       end
#       it 'prefecture_idが0を選ばれていると保存ができない' do
#         @item.prefecture_id = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
#       end
#       it 'prefecture_idがないと保存ができない' do
#         @item.prefecture_id = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Prefecture can't be blank")
#       end
#       it 'scheduled_delivery_idが0を選ばれていると保存ができない' do
#         @item.scheduled_delivery_id = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 0")
#       end
#       it 'scheduled_delivery_idがないと保存ができない' do
#         @item.scheduled_delivery_id = ''
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
#       end
#       it 'ユーザーと紐付いていない' do
#          @item.wada = nil
#          @item.valid?
#          expect(@item.errors.full_messages).to include("Wada must exist")
#       end
#     end
#   end
# end

require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    binding.pry
  end

  describe '商品出品' do
    context '商品出品が成功する' do
      it 'すべての情報が正しく入力されている' do
        expect(@item).to be_valid
      end
    end

    context '商品出品が失敗する' do
      it '商品名が空' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it '画像が空' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Images can't be blank", "Images は1枚以上5枚以下にしてください")
      end
      it 'カテゴリーが未選択' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it '商品の状態が未選択' do
        @item.sales_status_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status is not a number')
      end
      it '配送料の負担が未選択' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status is not a number')
      end
      it '発送元の地域が未選択' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it '発送までの日数が未選択' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery is not a number')
      end
      it '商品価格が空' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '商品価格の範囲が300〜9,999,999円' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '商品価格が全角数字' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '商品価格が半角英字' do
        @item.price = 'yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'ユーザーと紐付いていない' do
        @item.wada = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Wada must exist')
      end
    end
  end
end
