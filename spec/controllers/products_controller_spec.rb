require 'spec_helper'
#describe ProductsController, "Creating a new product" do
#	integrete_views 

	
	describe ProductsController do
  describe "GET index" do
    fixtures :products

    it "assigns all products to @products" do
      get :index
      assigns(:products).should eq(Product.all)
    end
  end
end

