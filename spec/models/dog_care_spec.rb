require 'rails_helper'

RSpec.describe DogCare, type: :model do
  let(:dog_care) { create(:dog_care) }

  describe '項目に不備がない場合' do
    it '有効である' do
      expect(dog_care).to be_valid
    end
  end
end
