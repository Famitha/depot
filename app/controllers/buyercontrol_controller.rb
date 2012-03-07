class BuyercontrolController < ApplicationController
	def create
@order = Order.new(params[:order])
@order.add_line_items_from_cart(current_cart)
respond_to do |format|
if @order.save
Cart.destroy(session[:cart_id])
session[:cart_id] = nil
format.html {  redirect_to buyercontrol_index_path, :notice => 'Order was successfully created.' }
format.xml { render :xml => @order, :status => :created,:location => @order }
else
format.html { render :action => "new" }
format.json { render :json => @order.errors,
:status => :unprocessable_entity }
end
end
end
	def index
	user=User.find(session[:user_id])
p 1111111111111
#p user.id
    @order = user.orders.paginate :page=>params[:page], :order=>'created_at desc' ,
:per_page => 10
		respond_to do |format|
		  format.html # index.html.erb
      format.xml { redirect_to buyercontrol_index_path }
    end
	end
	
	def show
				 @order = Order.find(params[:id])
				 
				  	

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @order }
    end
    end
	def new
    
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @order }
    end
  end
 
	
	def edit
		@order = Order.find(params[:id])
			end
	def update
		
		@order = Order.find(params[:id])
		respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order , :notice => 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "useredit" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
		end
end
