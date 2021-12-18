class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  def new
    @user = User.new
  end
  
  def show
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "success"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "更新しました。"
      case params[:setting_id]  #更新成功時に遷移元のページにリダイレクト。1の時は設定ページ、2の時はプロフィールページに遷移。
        when "1"
           redirect_to @user
        when "2"
           redirect_to profile_users_path
      end
    else
      case params[:setting_id]  #更新成功時に遷移元のページにリダイレクト。1の時は設定ページ、2の時はプロフィールページに遷移。
        when "1"
           render 'edit'
        when "2"
           render profile_users_path
      end
    end
  end
  
  def profile
    @user = current_user
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon, :introduction)
    end
    
    # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end