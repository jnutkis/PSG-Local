class ProductsController < ApplicationController
  def show
    @vendor = Vendor.friendly.find(params[:vendor_id])
    @product = @vendor.products.friendly.find(params[:id])
  end
  def new
    @product = Product.new
    if admin?
      @vendor = Vendor.find_by(id: current_user.vendor_id).name
      if !@vendor == params[:vendor_id]
        redirect_to root_path
      end
    elsif super?
      @product.vendor_id = Vendor.find_by(name: params[:vendor_id]).id
    end
  end
  
  def create
    if super? #check if super, if so, use vendor param in URL
      @product = Product.new(product_params)
      @product.vendor_id = Vendor.find_by(name: params[:vendor_id]).id
   
        if @product.save
          redirect_to administration_path
        else
          render 'new'
        end
        
    elsif admin? #check if vendor admin, if so, pass vendor info from table if matches URL
      @vendor = Vendor.find_by(id: current_user.vendor_id).name
      if @vendor == params[:vendor_id]
        @product = Product.new(product_params)
        @product.update(vendor: Vendor.find_by(id: current_user.vendor_id))
        
          if @product.save
            redirect_to administration_path
          else
            redirect_to new_vendor_product_path :notice => 'Product Name is Required'
          end

      else 
          redirect_to administration_path
      end  
    else #if neither, take home
      redirect_to root_path
    end
  end
  
    private
    def product_params
      params.require(:product).permit(:name,:description,:url,:references)
    end

end
