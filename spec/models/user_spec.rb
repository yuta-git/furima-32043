require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザ新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全項目が入力されていれば登録できること' do
      expect(@user).to be_valid
    end

    it 'ニックネームが空だと登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが空だと登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'パスワードが空だと登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'ユーザーの名字と名前が空では登録できないこと' do
      @user.family_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "First name can't be blank")
    end

    it '名字と名前のカナが空だと登録できないこと' do
      @user.family_name_kana = ''
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "First name kana can't be blank")
    end

    it '誕生日が空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'メールアドレスは@が必須であること' do
      @user.email = '1234abcb'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'メールアドレスが一意性であること(重複していると登録できない)' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'パスワードは5文字以下では登録できないこと' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードとパスワード(確認用)は一致が必須であること' do
      @user.password = '1234@abcd'
      @user.password_confirmation = '5678@efgh'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは確認用と合わせて２回入力が必須であること' do
      @user.password = '1234abcd'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは半角英数の混合での入力が必須であること' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
    end
  end
end
