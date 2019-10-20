class ProductEntriesController < ApplicationController
  before_action :set_product_entry, only: [:show, :edit, :update, :destroy]

  # GET /product_entries
  # GET /product_entries.json
  def index
    @product_entries = ProductEntry.all
  end

  # GET /product_entries/1
  # GET /product_entries/1.json
  def show
  end

  # GET /product_entries/new
  def new
    @product_entry = ProductEntry.new
  end

  # GET /product_entries/1/edit
  def edit
  end

  # POST /product_entries
  # POST /product_entries.json
  def create
    @product_entry = ProductEntry.new(product_entry_params)

    respond_to do |format|
      if @product_entry.save
        format.html { redirect_to @product_entry, notice: 'Product entry was successfully created.' }
        format.json { render :show, status: :created, location: @product_entry }
      else
        format.html { render :new }
        format.json { render json: @product_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_entries/1
  # PATCH/PUT /product_entries/1.json
  def update
    respond_to do |format|
      if @product_entry.update(product_entry_params)
        format.html { redirect_to @product_entry, notice: 'Product entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_entry }
      else
        format.html { render :edit }
        format.json { render json: @product_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_entries/1
  # DELETE /product_entries/1.json
  def destroy
    @product_entry.destroy
    respond_to do |format|
      format.html { redirect_to product_entries_url, notice: 'Product entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_entry
      @product_entry = ProductEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_entry_params
      params.require(:product_entry).permit(:payment_date, :forecast_receipt_date, :receipt_date, :amount, :price, :observation, :product_id, :supplier_id)
    end
end
