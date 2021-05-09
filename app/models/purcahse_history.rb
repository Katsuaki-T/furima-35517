class PurcahseHistory < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one :sending_address
  
end
