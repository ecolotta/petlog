class DogSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :birthday

  belongs_to :user
end
