class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ show update destroy ]

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
    render json: @cart_item
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    @cart_item = CartItem.new(cart_item_params)

    if @cart_item.save
      render json: @cart_item, status: :created
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    if @cart_item.update(cart_item_params)
      render json: @cart_item, status: :ok
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    render json: @cart_item.destroy, status: :accepted
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.fetch(:cart_item, {})
    end
end
