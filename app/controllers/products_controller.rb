class ProductsController < ApplicationController
  def show
    @vendor = Vendor.friendly.find(params[:vendor_id])
    @product = @vendor.products.friendly.find(params[:id])
  end
  def new
    @product = Product.new
    @vendor = Vendor.find_by(id: current_user.vendor_id).name
    if !@vendor == params[:vendor_id]
      redirect_to root_path
    end
  end
  
  def create
    @vendor = Vendor.find_by(id: current_user.vendor_id).name
    if @vendor == params[:vendor_id]
      @product = Product.new(product_params)
      @product.update(vendor: Vendor.find_by(id: current_user.vendor_id))
      if @product.save
        redirect_to administration_path
      else
        flash[:danger] = @product.errors.full_messages
        render 'new'
      end
      
    else
      redirect_to root_path
    end
  end
  
    private
    def product_params
      params.require(:product).permit(:name,:description,:url,:references)
    end

end
