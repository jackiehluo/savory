class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:create, :new]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      session[:user_id] = user.id
      redirect_to lists_url
    else
      render "new"
    end  
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end
end
