class ReferencesController < ApplicationController
  def index
    @references = Reference.all.order(:full_ref).page(params[:page]).per(25)
    @q = Reference.ransack(params[:q])
    @r = @q.result(distinct:true).order(:full_ref).page(params[:page]).per(25)
  end
  
  def show
    @reference = Reference.friendly.find(params[:id])
  end
end
