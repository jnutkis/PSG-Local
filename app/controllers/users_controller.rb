class UsersController < ApplicationController
  include UsersHelper
  before_action :active?,:vendor_active?
  
    def new
      @user = User.new
    end
  
    def create
    @user = User.new(new_user_params)
    @user.vendor_id = current_user.vendor_id
    if @user.save
      @user.send_activation_email
      flash[:success] = "User has been sent an activation email"
      redirect_to administration_url
    else
      render 'new' 
    end
  end
  
  
  
  def show
    @user = current_user
    if !logged_in? || current_user.vendor_id != User.find(params[:id]).vendor_id
      redirect_to root_path
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path

  end
  
  
  def edit
    @user = User.find(params[:id])
    @right = true if current_user.id == params[:id].to_i
    if super?
      
    elsif !logged_in? || current_user.vendor_id != User.find(params[:id]).vendor_id
      redirect_to root_path
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end
  
  def update
    @user = User.find(params[:id])
    if super?
    elsif !logged_in? || current_user.vendor_id != User.find(params[:id]).vendor_id
      redirect_to root_path
    end
    if @user.update_attributes(user_params)
      flash[:success] = "Account Updated"
      redirect_to administration_path
    elsif
      flash[:danger] = @user.errors.full_messages.to_sentence
      redirect_to edit_user_path
     
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :active)
  end
  
   def new_user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

end
