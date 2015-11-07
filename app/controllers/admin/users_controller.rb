class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.unarchived.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: 'From the mighty fires you have forged a new user.'
    else
      flash.now[:alert] = "User not Created"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User Updated'
    else
      flash.now[:alert] = 'User not Updated'
      render :edit
    end
  end

  def archive
    @user = User.find(params[:id])
    if @user == current_user
      flash[:alert] = 'Cannot archive yourself'
    else
      @user.archive
      flash[:notice] = 'User has been archived'
    end

    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
