require 'rails_helper'

RSpec.describe Dog, type: :model do
  let(:dog) { create(:dog) }

  describe '項目に不備がない場合' do
    it '有効である' do
      expect(dog).to be_valid
    end
  end
end
