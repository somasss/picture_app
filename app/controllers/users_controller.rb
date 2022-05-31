class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
     else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    user_check
  end

  def edit
    @user = User.find(params[:id]) 
    user_check
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        redirect_to user_path(@user.id)
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end
    end
  end

  def favorite
    @favorite_all = current_user.favorite_feeds
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation, :image, :image_cache)
  end
end
