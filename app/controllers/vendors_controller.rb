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
  
  
end
