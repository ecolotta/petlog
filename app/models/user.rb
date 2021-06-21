class User < ApplicationRecord
  authenticates_with_sorcery!
  
  attr_accessor :password, :password_confirmation
  
  validates :email, uniqueness: true
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_one :dog, dependent: :destroy

  def line_uid
    authentications.where(provider: 'line').first.uid
  end
end
