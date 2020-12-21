class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  valid_password_zenkaku = /\A[ぁ-んァ-ン一-龥]/
  valid_password_zenkaku_kana = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :nickname
    validates :password,           format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :first_name,         format: { with: valid_password_zenkaku }
    validates :last_name,          format: { with: valid_password_zenkaku }
    validates :first_name_kana,    format: { with: valid_password_zenkaku_kana }
    validates :last_name_kana,     format: { with: valid_password_zenkaku_kana }
    validates :birthday
  end
end
