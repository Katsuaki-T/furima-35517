class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
               ,:purchase_history_id, :user_id, :item_id

 with_options presence: true do   
  validates :postal_code 
  validates :prefecture_id 
  validates :city
  validates :house_number 
  validates :phone_number 
  validates :purchase_history_id
  validates :user_id
  validates :item_id
 end

end