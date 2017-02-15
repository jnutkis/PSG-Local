class UsersController < ApplicationController
  def login
    
  end
  
  def index
    @user = current_user
    if !logged_in? || current_user != User.find(params[:id])
      redirect_to root_path
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path

  end
  
end
