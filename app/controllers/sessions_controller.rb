class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in succesfully"
      redirect_to user
    else
      flash.now[:alert] = "Somethings wrong!"
      render "new"
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out . See you soon !"
    redirect_to root_path
  end

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to articles_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
