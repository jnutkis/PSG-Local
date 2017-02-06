class ReferencesController < ApplicationController
  def index
    @references = Reference.all.order(:short_ref)
  end
  
  def show
    @reference = Reference.friendly.find(params[:id])
  end
end
