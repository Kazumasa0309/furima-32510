class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  valid_password_hankaku = /\A[a-z0-9]+\z/i
  valid_password_zenkaku = /\A[ぁ-んァ-ン一-龥]/
  valid_password_zenkaku_kana = /\A[ァ-ヶー－]+\z/
  message_zenkaku = "お名前は、全角で入力してください。"
  message_zenkaku_kana = "お名前カナは、全角カタカナで入力してください。"
  with_options presence: true do
    validates :nickname
    validates :email,              uniqueness: true
    validates :encrypted_password, length: { minimum: 6 }, format: { with: valid_password_hankaku }
    validates :first_name,         format: { with: valid_password_zenkaku, message: message_zenkaku }
    validates :last_name,          format: { with: valid_password_zenkaku, message: message_zenkaku }
    validates :first_name_kana,    format: { with: valid_password_zenkaku_kana, message: message_zenkaku_kana }
    validates :last_name_kana,     format: { with: valid_password_zenkaku_kana, message: message_zenkaku_kana }
    validates :birthday
  end
end
