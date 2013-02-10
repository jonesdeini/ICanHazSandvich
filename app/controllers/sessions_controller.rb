class SessionsController < ApplicationController

before_filter :already_authenticated, except: [:destroy]

  def new
    redirect_to('/auth/steam')
  end

  def create
    auth = request.env["omniauth.auth"]
    if user = User.find_or_create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to searches_path
    else
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil

    redirect_to root_path
  end

  protected

  def already_authenticated
    redirect_to searches_path if current_user
  end

end
