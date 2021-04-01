class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    # if @order_address.valid?
    #   @order_address.save
    #   redirect_to root_path
    # else
    #   render item_orders_path(params.item_id)
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :block_number, :building, :phone_number)
  end


end
