require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録機能' do
    context '新規登録できる時' do
      it '必要なデータが全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上で英数字混在であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailには@を含まなければ登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordは６文字以上でなければ登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordは数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end
      it 'passwordは英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameが全角(漢字・ひらがな・カタカナ)以外では登録できない' do
        @user.last_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name Full-width characters"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)以外では登録できない' do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name Full-width characters"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_name_kanaが全角カタカナ以外では登録できない' do
        @user.last_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana Full-width katakana characters"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'first_name_kanaが全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana Full-width katakana characters"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end