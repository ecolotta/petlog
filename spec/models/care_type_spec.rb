require 'rails_helper'

RSpec.describe CareType, type: :model do
  let(:care_type) { create(:care_type) }

  describe '項目に不備がない場合' do
    it '有効である' do
      expect(care_type).to be_valid
    end
  end

  describe '項目に不備がある場合' do
    context 'nameが未入力の場合' do
      it '無効である' do
        care_type.name = ''
        expect(care_type).to_not be_valid
      end
    end
  end
end
