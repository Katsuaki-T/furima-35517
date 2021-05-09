require 'rails_helper'

RSpec.describe PurchaseHistory, type: :model do
  describe '商品購入機能' do
    before do
      @purchase_history = FactoryBot.create(:purchase_history)
    end
end
