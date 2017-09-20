class SessionsController < ApplicationController

  def new
    render 'devise/sessions/new'
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user.valid_password?(params[:session][:password])
      sign_in(user)
      session[:user_id] = user.id
      redirect_to dashboard_index_path unless user.type.nil?
      redirect_to new_type_selection_path if user.type.nil?
    else
      flash[:message] = "Username/password invalid, try again"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'Logged out!'
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
  end
end
