class Wada < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # <<バリデーション>>
  validates :nickname, presence: true, uniqueness: { case_sensitive: true }

  validates :birth_date, presence: true

  # パスワードの英数字混在を否定
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid'

  # 全角のひらがなor漢字を使用していないか検証
  with_options presence: true,  format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :last_name
    validates :first_name
  end
  valid_name_kana_regex = /\A[ァ-ヶー]+\z/
  # 全角のカタカナを使用していないか検証
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end

  # <<アソシエーション>>
  has_many :items
  has_many :orders
end

