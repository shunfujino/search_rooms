class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_current_user
  
  def search
    @rooms = Room.search(params[:area],params[:keyword])
    # byebug
    @keyword = params[:keyword]
    @area = params[:area]
    render "search"
  end

  def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  def ensure_correct_user
    if @current_user.id != params[:user_id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
end
