class UsersController < ApplicationController
  before_action :already_login, only: [:new, :create, :login, :authentication]
  before_action :require_login, only: [:index, :logout]

  def index; end

  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      session[:user_id] = @user.id
      flash[:success] = "User Is Created"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def login
  end

  def authentication
    @user = User.where(email: params[:email]).take
    if @user && @user.authenticate(params[:password])
      reset_session
      session[:user_id] = @user.id
      flash[:success] = "Login Successfully."
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid Email Or Password."
      render :login, status: :unprocessable_entity
    end
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :cvv_number, :credit_card_number, :password)
  end
end
