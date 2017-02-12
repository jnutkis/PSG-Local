class AdminsController < ApplicationController
  def index
    if !admin? && !super?
      redirect_to root_path
    end
  end
end
