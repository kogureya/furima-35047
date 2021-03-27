require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できる時' do
      it '必要なデータが全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上で英数字混在であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
      end
    end
  end
end