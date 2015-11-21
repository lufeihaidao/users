class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :upload_avatar]
  before_action :admin_user, only: [:add, :destroy]


  def index
    @users = User.page params[:page]
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  def show
  end
  def new
    @user = User.new
  end
  def add
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
  end
  def update
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
  def upload_avatar
    respond_to do |format|
      if @user.update_attributes(user_avatar_params)
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

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  def admin_user
      redirect_to(root_path) unless current_user.admin?
  end

  def user_create_params
    params.require(:user).permit(:email)
  end
  def user_update_params
    params.require(:user).permit(:name, :phone, :qq, :admin, :birthday)
  end
  def user_avatar_params
    params.require(:user).permit(:avatar)
  end
end
