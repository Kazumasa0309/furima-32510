require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)  # Userのインスタンス生成
  end

  describe 'ユーザー新規登録' do
    it "ニックネームが空だと登録できない" do
      @user.nickname = ""  # nicknameの値を空にする
      @user.valid?
    end
    it "emailが空では登録できない" do
    end
  end
end
