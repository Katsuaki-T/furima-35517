class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_time_id
  end

  belongs_to :user
  has_one_attached :image
  has_one :purchase_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :delivery_time
end
