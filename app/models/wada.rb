class Wada < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  # <<バリデーション>>
  validates :nickname, presence: true

  validates :birth_date, presence: true

  # パスワードの英数字混在を否定
  PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid'

  # 全角のひらがなor漢字を使用していないか検証
  with_options presence: true,  format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/i } do
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
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    wada = Wada.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
  
  if wada.persisted?
    sns.wada = wada
    sns.save
  end
  { wada: wada, sns: sns }
end
end

