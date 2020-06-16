class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  #before_action  :authenticate_user!, only: [:index, :update]

  # GET /users
  def index
    #if current_user.admin
    #  @users = User.all.order("id desc")
    #else
    #  @users = User.where(id: current_user.id)
    @users = User.all.order("id desc")
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  ##Only makes the update of the disabled field
  def update
    puts "current user"
    puts @user.id
    puts current_user.id
    if current_user.admin || @user.id == current_user.id
      if user_params['is_disabled']
        @user.tokens = nil
      end
      if @user.update(user_params)
        render json: @user
      else
        puts @user.errors.full_messages
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: @user.errors, status: :bad_request
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:is_disabled, :password, :password_confirmation, :name, :last_name, :email, :admin)
    end
end
