class VendorsController < ApplicationController
  
  def index
    @vendors = Vendor.where(active: 1).order(:name).page(params[:page]).per(18)
    @q = Vendor.where(active: 1).ransack(params[:q])
    @r = @q.result(distinct:true).order(:name).page(params[:page]).per(18)
  end
  
  def show
    @vendor = Vendor.where(active: 1).friendly.find(params[:id])
    @products = Vendor.friendly.find(params[:id]).products.order(:name).page(params[:page]).per(8)
    @count = 0
    
   rescue ActiveRecord::RecordNotFound
   redirect_to vendors_path
  end
  
  def new
    redirect_to root_path if !super?
    @vendor = Vendor.new
  end
  
  def create
    redirect_to root_path if !super?
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      @vendor.update_attribute(:active, 1)
      flash[:success] = "#{@vendor.name} Added!"
      redirect_to administration_path
    else
      flash.now[:danger] = @vendor.errors.full_messages.to_sentence
      render 'new'
    end
  end
  
  def edit 
    redirect_to vendors_path if !super?
    @vendor = Vendor.find_by(name: params[:id]) 
    if @vendor.nil?
      redirect_to administration_path
    end
  end
   
  def update
    redirect_to vendors_path if !super?
    @vendor = Vendor.find_by(name: params[:id]) 
    if @vendor.update(vendor_params)
      flash[:success] = "#{@vendor.name} Updated!"
      redirect_to administration_path
    else
      flash[:danger] = @vendor.errors.full_messages.to_sentence
      render 'edit'
    end
  end
  
  
  
  
  private
  def vendor_params
    params.require(:vendor).permit(:name,:active,:website,:email,:phone)
  end
  
end
