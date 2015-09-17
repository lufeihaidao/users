class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.page params[:page]
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  def show
    @user = User.find params[:id]
  end
  def new
    @user = User.new
  end
  def add
    binding.pry
    @user = User.add user_create_params[:email]
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path }
      else
        format.html { render action: "new" }
      end
    end
  end
  def edit
    @user = User.find params[:id]
  end
  def update
    @user = User.find params[:id]
    respond_to do |format|
      if @user.update_attributes(user_update_params)
        format.html {redirect_to :back}
        format.js { render :layout => false }
      else
        format.html {render action: "edit"}
        format.js { render :layout => false }
      end
    end
  end
  def destroy
    @user = User.find params[:id]
  end
  private

  def user_create_params
    params.require(:user).permit(:email)
  end
  def user_update_params
    params.require(:user).permit(:name, :phone, :qq, :admin, :birthday)
  end
end
