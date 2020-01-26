class ProductExitsController < ApplicationController
  before_action :set_product_exit, only: [:edit, :update, :destroy]

  def index
    @product_exits = ProductExit.all
  end

  def new
    @product_exit = ProductExit.new
  end

  def edit
  end

  def create
    @product_exit = ProductExit.new(product_exit_params)
    create_crud(@product_exit, product_exit_path)
  end

  def update
    update_crud(@product_exit, product_exit_params, product_exit_path)
  end

  def destroy
    destroy_crud(@product_exit, product_exit_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_exit
      @product_exit = ProductExit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_exit_params
      params.require(:product_exit).permit(:amount, :price, :observation, :comission, :product_id, :seller_id)
    end
end
