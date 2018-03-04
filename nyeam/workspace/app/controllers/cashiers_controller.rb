class CashiersController < ApplicationController
  before_action :set_cashier, only: [:show, :edit, :update, :deactivate]
  
  def index
    @cashiers = Cashier.where(status: true)
  end
  
  def new
    @cashier = Cashier.new
  end
  
  def create
    @cashier = current_admin.cashiers.new(cashier_params)
    if @cashier.save
      redirect_to @cashier
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @cashier.update(cashier_params)
      redirect_to @cashier
    end
  end
  def deactivate
    @cashier.update(status: false)
    if @cashier.save
      redirect_to cashiers_path
    end
  end
  
  def destroy
    
  end
  
  private
    def set_cashier
      @cashier = Cashier.find(params[:id])
    end
    def cashier_params
      params.require(:cashier).permit!
    end
end
