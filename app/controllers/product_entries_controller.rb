class ProductEntriesController < ApplicationController
  before_action :set_product_entry, only: [:edit, :update, :destroy]
  before_action :get_products, only: [:edit, :new]
  before_action :get_suppliers, only: [:edit, :new]

  def index
    @product_entries = ProductEntry.all.includes(:product, :supplier)
  end

  def new
    @product_entry = ProductEntry.new
  end

  def edit
  end

  def create
    @product_entry = ProductEntry.new(product_entry_params)
    create_crud(@product_entry, product_entries_path)
  end

  def update
    update_crud(@product_entry, product_entry_params, product_entries_path)
  end

  def destroy
    destroy_crud(@product_entry, product_entries_path)
  end

  private

  def get_products
    @products = Product.all.includes(:category, :subcategory)
  end

  def get_suppliers
    @suppliers = Supplier.all
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_product_entry
    @product_entry = ProductEntry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_entry_params
    params.require(:product_entry).permit(:payment_date, :forecast_receipt_date, :receipt_date, :amount, :price, :observation, :product_id, :supplier_id)
  end
end
