class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])

    if current_user == @item.user || @item.purchase_history != nil
      redirect_to root_path
   end
    @purchase_address = PurchaseAddress.new
    
    
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_history_params)
    @item = Item.find(params[:item_id])

    if @purchase_address.valid?
      payjp_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end


 private

  def purchase_history_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, 
      :house_number, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def payjp_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_history_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  


end
