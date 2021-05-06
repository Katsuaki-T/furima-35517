class Item < ApplicationRecord

    with_options presence: true do
      validates :name
      validates :description
      validates :image
      validates :price, format: { with: /^[0-9]+$/ }, inclusion: { in: 300..9_999_999 }
    end


   with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_time_id
  end



    
end
