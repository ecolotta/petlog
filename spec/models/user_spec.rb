require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe '項目に不備がない場合' do
    it '有効である' do
      expect(user).to be_valid
    end
  end

  describe '同じメールアドレスを登録した場合' do
    it '無効である' do
      user_with_duplicate_email = build(:user, email: user.email)
      expect(user_with_duplicate_email).to_not be_valid
    end
  end

end
