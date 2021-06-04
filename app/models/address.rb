class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates  :address, presence: true
end
