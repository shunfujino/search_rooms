class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all 
  end

  def show

  end

  def profile
    
  end

  def create
    @user = User.new(user_name: params[:user_name], email: params[:email], password: params[:password],password_confirmation: params[:password_confirmation], user_icon: "default_icon.jpg") 
    if @user.save
      session[:user_id]=@user.id
      flash[:notice] = "ユーザーの登録に成功"
      redirect_to("/users/#{@user.id}/profile")
    else
      flash[:notice] = "登録失敗"
      render("/users/new")
    end
  end

  # プロフィール更新
  def update
    @current_user = User.find_by(id: params[:id])
    @current_user.user_name = params[:user_name]
    @current_user.user_info = params[:user_info]    
    if params[:user_icon]
      @current_user.user_icon = "#{@current_user.id}.jpg"
      image = params[:user_icon]
      File.binwrite("public/user_icons/#{@current_user.user_icon}", image.read)
    end
    if @current_user.save
      @current_user.save
      flash[:notice] = "プロフィールを更新しました"
      redirect_to("/users/#{@current_user.id}/profile")
    else
      flash.now[:notice] = "失敗"
      render("users/profile")
    end
  end
# アカウント確認画面
  def account
    
  end

  # アカウント編集画面
  def edit_account
    @user = @current_user
  end

  # アカウント情報更新処理
  def update_account
    @user = User.find_by(id: @current_user.id)
    if @user.authenticate(user_params[:current_password])
      # 現在のパスワードがあっている
      if user_params[:password] == user_params[:password_confirmation]
        @user.email = user_params[:email]
        @user.password = user_params[:password]
        if @user.save
          @user.save
          flash[:notice] = "更新しました"
          redirect_to("/users/#{@user.id}/account")
        else
          flash[:notice] = "登録失敗"
          render :edit_account
        end
      else
        flash[:notice] = "確認パスワードが間違えています"
        render :edit_account
      end
    else
      flash[:notice] = "現在のパスワードが間違っています"
      render :edit_account
    end
  end

  def login_form

  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}/profile")
    else
      @error_message = "アドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render "users/login_form"
    end
  end

  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to ("/login")
  end

  # 所有している部屋
  def owns
    
  end

  # 予約済みの部屋一覧
  def reservations

  end

  # 予約済みの部屋詳細確認
  def reservations_show
    @booking = Booking.find_by(id: params[:id])
    @room = Room.find_by(id: @booking.room_id)
  end
end

private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:user_name,:email,:password,:user_icon,:user_info, :password_confirmation, :current_password)
  end