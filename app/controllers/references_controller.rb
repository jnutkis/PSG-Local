class ReferencesController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  def index
    @references = Reference.all.order(:full_ref).page(params[:page]).per(25)
    @q = Reference.ransack(params[:q])
    @r = @q.result(distinct:true).order(:full_ref).page(params[:page]).per(25)
    
  end
  
  def show
    @reference = Reference.friendly.find(params[:id])
    @products = Reference.friendly.find(params[:id]).products.order(:name).page(params[:page]).per(25)
  end
end
