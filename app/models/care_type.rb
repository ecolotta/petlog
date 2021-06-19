class CareType < ApplicationRecord
  validates :name, presence: true
  has_many :dog_cares, dependent: :destroy
end
