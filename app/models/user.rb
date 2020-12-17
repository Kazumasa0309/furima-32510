class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email,              uniqueness: true
    validates :encrypted_password, length: { minimum: 6 }
    validates :first_name,         format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "お名前は、全角で入力してください。"}
    validates :last_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "お名前は、全角で入力してください。"}
    validates :first_name_kana,    format: { with: /\A[ァ-ヶー－]+\z/, message: "お名前カナは、全角カタカナで入力してください。"}
    validates :last_name_kana,     format: { with: /\A[ァ-ヶー－]+\z/, message: "お名前カナは、全角カタカナで入力してください。"}
    validates :birthday
  end
end
