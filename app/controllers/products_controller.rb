class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :get_categories, only: [:index, :new, :edit]
  before_action :get_subcategories, only: [:index, :new, :edit]

  def index
    @products = Product.includes(:category, :subcategory).all
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    create_crud(@product, products_path)
  end

  def update
    update_crud(@product, product_params, products_path)
  end

  def destroy
    destroy_crud(@product, products_path)
  end

  private

  def get_categories
    @categories = Category.all
  end

  def get_subcategories
    @subcategories = Subcategory.all
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :comission, :category_id, :subcategory_id)
  end
end
