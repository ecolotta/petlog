class Dog < ApplicationRecord
  belongs_to :user
  has_many :dog_cares, dependent: :destroy

  #昨日お世話登録されていない犬
  scope :no_dog_cares_since_yesterday, -> { where.not(id: DogCare.select("dog_id").where("created_at >= ?", 1.day.ago.beginning_of_day)) }
end
