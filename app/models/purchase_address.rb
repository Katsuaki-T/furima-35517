class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "の値を確認してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "の値を確認してください" }

    validates :user_id
    validates :item_id

    validates :token
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)

    sendind_address = SendingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                                            house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end
