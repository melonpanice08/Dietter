class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :edit, :update]
  
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
 
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
      render :edit
    end   
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :target_weight, :target_bodyfat, :image)
  end
  
end
