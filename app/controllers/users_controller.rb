# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    if current_user
      @user = User.find(current_user.id)
      @facade = MovieFacade 
    else   
      flash[:error] = "Log in to view this page"
      redirect_to root_path
    end 
  end

  def create
    @user = User.new(user_params)
    if User.exists?(email: @user.email)
      flash[:notice] = "Email already exists"
      redirect_to "/register"
    elsif @user.save 
      redirect_to "/users/#{@user.id}"
    else   
      render :new 
    end
  end

  def new
    @user = User.new
  end

  def login_form
  end

  def login 
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to dashboard_path
    else  
      flash[:error] = "Oops username or password is wrong, nice try lil chump"
      redirect_to login_path
    end
    # if user.nil? 
    #   flash[:notice] = "Oops username or password is wrong, nice try lil chump"
    #   render :login_form
    # elsif user.authenticate(params[:password])
    #   session[:user_id] = user.id 
    #   flash[:success] = "Welcome, #{user.name}!"
    #   redirect_to user_path(user)
    # else
    #   flash[:notice] = "Oops username or password is wrong, nice try lil chump"
    #   render :login_form
    # end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
