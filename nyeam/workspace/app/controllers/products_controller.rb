class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :deactivate, :destroy]
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = current_admin.products.new(product_params)
    if @product.save
      redirect_to @product
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @product.update(product_params)
      redirect_to @product
    end
  end
  
  def reports
    @products = Product.all
  end
  
  def destroy
    @product.update(status: false)
    if @product.save
      redirect_to products_path
    end
  end
  
  private
    def set_product
      @product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit!
    end
end
