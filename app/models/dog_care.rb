class DogCare < ApplicationRecord
  belongs_to :dog
  belongs_to :care_type
end
