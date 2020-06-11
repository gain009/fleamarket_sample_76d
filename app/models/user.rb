class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 7 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数字のみ使えます" }
  validates :encrypted_password, presence: true, length: { minimum: 7 }
  validates :family_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "全角のみ使えます" }
  validates :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "全角のみ使えます" }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみ使えます" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみ使えます" }
  validates :birth_day, presence: true

  has_many :items
  has_one :destination
  has_one :card
end
