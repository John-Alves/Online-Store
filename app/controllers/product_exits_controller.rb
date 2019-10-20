class ProductExitsController < ApplicationController
  before_action :set_product_exit, only: [:show, :edit, :update, :destroy]

  # GET /product_exits
  # GET /product_exits.json
  def index
    @product_exits = ProductExit.all
  end

  # GET /product_exits/1
  # GET /product_exits/1.json
  def show
  end

  # GET /product_exits/new
  def new
    @product_exit = ProductExit.new
  end

  # GET /product_exits/1/edit
  def edit
  end

  # POST /product_exits
  # POST /product_exits.json
  def create
    @product_exit = ProductExit.new(product_exit_params)

    respond_to do |format|
      if @product_exit.save
        format.html { redirect_to @product_exit, notice: 'Product exit was successfully created.' }
        format.json { render :show, status: :created, location: @product_exit }
      else
        format.html { render :new }
        format.json { render json: @product_exit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_exits/1
  # PATCH/PUT /product_exits/1.json
  def update
    respond_to do |format|
      if @product_exit.update(product_exit_params)
        format.html { redirect_to @product_exit, notice: 'Product exit was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_exit }
      else
        format.html { render :edit }
        format.json { render json: @product_exit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_exits/1
  # DELETE /product_exits/1.json
  def destroy
    @product_exit.destroy
    respond_to do |format|
      format.html { redirect_to product_exits_url, notice: 'Product exit was successfully destroyed.' }
      format.json { head :no_content }
    end
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
