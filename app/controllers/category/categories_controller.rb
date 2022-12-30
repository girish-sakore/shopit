class Category::CategoriesController < ApplicationController
  before_action :set_category_category, only: %i[ show update destroy ]

  # GET /category/categories
  # GET /category/categories.json
  def index
    @category_categories = Category::Category.all
  end

  # GET /category/categories/1
  # GET /category/categories/1.json
  def show
  end

  # POST /category/categories
  # POST /category/categories.json
  def create
    @category_category = Category::Category.new(category_category_params)

    if @category_category.save
      render :show, status: :created, location: @category_category
    else
      render json: @category_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /category/categories/1
  # PATCH/PUT /category/categories/1.json
  def update
    if @category_category.update(category_category_params)
      render :show, status: :ok, location: @category_category
    else
      render json: @category_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /category/categories/1
  # DELETE /category/categories/1.json
  def destroy
    @category_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_category
      @category_category = Category::Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_category_params
      params.fetch(:category_category, {})
    end
end
