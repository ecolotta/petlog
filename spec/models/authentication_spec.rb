require 'rails_helper'

RSpec.describe Authentication, type: :model do
  let(:authentication) { create(:authentication) }

  describe '項目に不備がない場合' do
    it '有効である' do
      expect(authentication).to be_valid
    end
  end

  describe '項目に不備がある場合' do
    context 'userが紐づかない場合' do
      it '無効である' do
        authentication.user = nil
        expect(authentication).to_not be_valid
      end
    end
    context 'providerが未入力の場合' do
      it '無効である' do
        authentication.provider = nil
        expect(authentication).to_not be_valid
      end
    end
    context 'uidが未入力の場合' do
      it '無効である' do
        authentication.uid = nil
        expect(authentication).to_not be_valid
      end
    end
  end
end
