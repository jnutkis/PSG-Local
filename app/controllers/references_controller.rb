class ReferencesController < ApplicationController
  def index
    @references = Reference.all.order(:short_ref).page(params[:page]).per(50)
    @q = Reference.ransack(params[:q])
    @r = @q.result(distinct:true)
  end
  
  def show
    @reference = Reference.friendly.find(params[:id])
  end
end
