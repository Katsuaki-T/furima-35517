class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,:user_id, :item_id

 with_options presence: true do   
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :prefecture_id ,numericality: { other_than: 1 }
  validates :city
  validates :house_number 
  validates :phone_number, format: {with: /\A\d{11}\z/ } 
  
  validates :user_id
  validates :item_id
 end

 def save
  purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)

  sendind_address = SendingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id,city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,purchase_history_id: purchase_history.id) 

 end

end