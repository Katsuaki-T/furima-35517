class User < ApplicationRecord

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :family_name
    validates :first_name_kana
    validates :family_name_kana
    validates :birthday
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
