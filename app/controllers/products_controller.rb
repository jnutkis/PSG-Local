class ProductsController < ApplicationController
  def show
    @vendor = Vendor.friendly.find(params[:vendor_id])
    @product = @vendor.products.friendly.find(params[:id])
  end
end
