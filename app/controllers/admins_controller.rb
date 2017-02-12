class AdminsController < ApplicationController
  def index
    if !admin?
      redirect_to root_path
    end
  end
end
