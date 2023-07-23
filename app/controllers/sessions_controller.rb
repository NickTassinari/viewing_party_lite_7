class SessionsController < ApplicationController
  def logout 
    session.delete(:user_id)
    flash[:message] = "Logged out Successfully"
    redirect_to root_path
  end
end