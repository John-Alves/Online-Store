class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:edit, :update, :destroy]
  before_action :get_categories, only: [:index, :new, :edit]

  def index
    @subcategories = Subcategory.includes(:category).all
  end

  def new
    @subcategory = Subcategory.new
  end

  def edit
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    create_crud(@subcategory, subcategories_path)
  end

  def update
    update_crud(@subcategory, subcategory_params, subcategories_path)
  end

  def destroy
    destroy_crud(@subcategory, subcategories_path)
  end

  private

  def get_categories
    @categories = Category.all
  end

  def set_subcategory
    @subcategory = Subcategory.find(params[:id])
  end

  def subcategory_params
    params.require(:subcategory).permit(:description, :category_id)
  end
end
