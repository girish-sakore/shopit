class UsersController < ApplicationController
  protect_from_forgery except: :create
  before_action :set_user, only: %i[ show update destroy ]
  before_action :authorize_request, except: :create
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    render json: @user
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

      if @user.save
        render :show, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
      if @user.update(user_params)
        render :show, status: :ok, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    response = @user.destroy
    if response
      render json: { delete: "success" }
    else
      render json: response, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      p "#{params.inspect}------"
      params.require(:user).permit(:name, :email, :number, :address, :password)
    end
end
