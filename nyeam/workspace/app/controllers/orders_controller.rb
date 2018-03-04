class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  def index
    @orders = Order.all
  end
  def new
    @order = Order.new
  end
  def tempcreate
     @order = current_cashier.orders.new(order_params)
      if @order.save
        redirect_to @order
      end
  end
  def create
    @order = current_cashier.orders.new(order_params)
    render :order_summary
  end
  def show
  end
  private
    def set_order
      @order = Order.find(params[:id])
    end
    def order_params
      params.require(:order).permit!
    end
end
