class Dog < ApplicationRecord
  belongs_to :user
  has_many :dog_cares, dependent: :destroy
end
