class SellersController < ApplicationController
  before_action :set_seller, only: [:edit, :update, :destroy]

  def index
    @sellers = Seller.all
  end

  def new
    @seller = Seller.new
  end

  def edit
  end

  def create
    @seller = Seller.new(seller_params)
    create_crud(@seller, seller_path)
  end

  def update
    update_crud(@seller, seller_params, seller_path)
  end

  def destroy
    destroy_crud(@seller, seller_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_params
      params.require(:seller).permit(:name)
    end
end
