class VendorsController < ApplicationController
  
  def index
    @vendors = Vendor.all.order(:name).page(params[:page]).per(25)
    @q = Vendor.ransack(params[:q])
    @r = @q.result(distinct:true).order(:name).page(params[:page]).per(25)
  end
  
end
