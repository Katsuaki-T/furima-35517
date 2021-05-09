class PurchaseHistoriesController < ApplicationController

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_history_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new
    end
  end


 private

  def purchase_history_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, 
      :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end


end
