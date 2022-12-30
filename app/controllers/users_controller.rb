class UsersController < ApplicationController
  protect_from_forgery except: %i[ create verify ]
  before_action :set_user, only: %i[ show update destroy ]
  before_action :authorize_request, except: :create
  # wrap_parameters :user, include: [:password, :password_confirmation]


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
    p "@user: #{@user.inspect}"
    if params[:password] == params[:password_confirmation]
      @user.password = params[:password]
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      @user.errors.add(:password_confirmation, "password confirmation not matching")
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
      if @user.update(user_params)
        render json: @user, status: :ok
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
      params.require(:user).permit(:photo, :name, :email, :number, :address, :password, :password_confirmation)
    end
end
