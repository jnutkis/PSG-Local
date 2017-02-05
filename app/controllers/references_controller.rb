class ReferencesController < ApplicationController
  def index
    @references = Reference.all.order(:short_ref)
  end
  
  def show
    @reference = Reference.find(params[:short_ref])
  end
end
