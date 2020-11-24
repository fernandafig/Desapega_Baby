class ProductsController < ApplicationController
  before_action :product_find, only: [:show, :edit, :update, :destroy] 

  def index 
    @products = Product.all 
  end

  def show 
  end

  def new
    @product = Product.new
  end

  def create 
    @product = Product.new(product_params)
    @product.owner = current_user
    if @product.save
      redirect_to product_path(@product)
    else 
      render :new 
    end
  end

  def edit
  end

  def update 
    @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to product_path(@product)
      else 
        render :edit
      end
  end 
  
  def destroy
    @product.destroy
    redirect_to products_path 
  end

  private

  def product_find
    @product = Product.find(params[:id])
  end

  def product_params 
    params.require(:product).permit(:name, :description, :brand, :price)
  end
end