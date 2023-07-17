# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
