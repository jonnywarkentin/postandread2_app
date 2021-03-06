class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:show, :index, :new, :create]
  before_filter :require_not_login, :only => [:new, :create]
  def index
    @users = User.all
  end

#action show get id from post request then find user to show on views
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Sign up successfully."
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:notice] = "Profile was updated."
      redirect_to user_url(@user)
    else
      redirect_to edit_user_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
