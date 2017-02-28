class PagesController < ApplicationController
  def index
  end  
  
  def searching
    q = params[:q]
    @refs = Reference.search(full_ref_or_specification_cont: q).result
    @products = Product.joins(:vendor).search(name_or_description_cont: q, vendor_active_eq: 1).result
    @vendors = Vendor.search(name_cont: q, active_eq: 1).result
    
    @refs_all = Reference.all
    @products_all = Product.all
    @vendors_all =  Vendor.all
  end
  
  
end

