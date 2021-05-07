class User < ApplicationRecord

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :family_name
    validates :first_name_kana
    validates :family_name_kana
    validates :birthday
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :first_name
    validates :family_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :first_name_kana
    validates :family_name_kana
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items

end
