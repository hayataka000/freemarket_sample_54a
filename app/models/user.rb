class User < ApplicationRecord
  has_many :items
  validates :nickname, presence: true, length: { minimum: 1, maximum: 20 }
  validates :last_name, :first_name, presence: true, length: { minimum: 1, maximum: 10 },
            format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "全角のみで入力して下さい" }

  validates :last_name_furigana, :first_name_furigana, presence: true, length: { minimum: 1, maximum: 10 },
            format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみで入力して下さい" }

  validates :password, :password_confirmation, presence: true, length: { minimum: 6},
            format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数字で入力して下さい" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
