class UsersController < ApplicationController
  include UsersHelper
  before_action :active?,:vendor_active?,:force_password
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(new_user_params)
      @user.vendor_id = current_user.vendor_id
      @user.admin = 1
      if @user.save
        @user.send_activation_email
        flash[:success] = "User has been sent an activation email"
        redirect_to administration_url
      else
        flash.now[:danger] = @user.errors.full_messages.to_sentence
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
  
  def force_pw
    @user = current_user
    if !logged_in?
      redirect_to root_path
    end
    if @user.newpw != 1
       redirect_to administration_path
    end
  end
  
  def update_pw
    @user = current_user
    if !logged_in?
      redirect_to root_path
    end
    if @user.newpw == 1
      if @user.update_attributes(password_params)
        @user.update_attribute(:newpw, 0)
        flash[:success] = "Password Updated"
        redirect_to administration_path
      elsif
        flash[:danger] = @user.errors.full_messages.to_sentence
        render 'force_pw'
      end
    else
      redirect_to administration_path
    end
  end
  
  
  
  private
  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :active)
  end
  
  def new_user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end
  
  def password_params
    params.require(:user).permit(:password,:password_confirmation)
  end


end
