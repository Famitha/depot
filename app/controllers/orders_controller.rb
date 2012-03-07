class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  skip_before_filter :authorize, :only => [:new, :create]
def feed
    @events = Order.order("updated_at desc")
    @title = "Rails Plugins Feed"
    @updated = @events.first.created_at unless @events.empty?
    respond_to do |wants|
      wants.rss do
        redirect_to orders_feed_path(:format => :atom),
                    :status=>:moved_permanently
      end
      wants.atom
    end
  end
  def index
    @orders = Order.paginate :page=>params[:page], :order=>'created_at desc',:per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.json{ render :json => @orders }
    end
    
  end


  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @order }
    end
  end
 
  
  # GET /orders/new
  # GET /orders/new.json
  def new
    if current_cart.line_items.empty?
redirect_to store_url, :notice => "Your cart is empty"
return
end

    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @order }
    end
  end
 
  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end
  

  # POST /orders
  # POST /orders.json
  def create
@order = Order.new(params[:order])
@order.add_line_items_from_cart(current_cart)

#if !session[:user_id].nil?
#@order.user_id=session[:user_id]  
#end

if ( @order.save )
  respond_to do |format|
 # puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
 #p @order
Cart.destroy(session[:cart_id])
session[:cart_id] = nil
#if session[:user_id]
  
Notifier.order_received(@order).deliver
#format.html {redirect_to paypalcontrolpay_url, :notice =>'Thank you for your order.'}
#else
#format.html {	redirect_to store_url, :notice => 'Thank you for your order.'}
format.html { redirect_to new_paypal_path, :notice =>'Thank you for your order.'  }
  end
  
	
#format.html {  redirect_to buyercontrol_userindex_path, :notice => 'Order was successfully created.' }
#format.html { redirect_to   paypalcontrolpay_url, :notice =>'Thank you for your order.'  }
#format.json { render :json => @order, :status => :created,
#:location => @order }
#format.xml { render :xml => @order, :status => :created,:location => @order }
#else
 # format.html {	redirect_to new_user_path, :notice => 'You have to sign up'}
    
  end
#else
#format.html { render :action => "new" }
#format.json { render :json => @order.errors, :status => :unprocessable_entity }
#end
#end
end


  # PUT /orders/1
  # PUT /orders/1.json
  
def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, :notice => 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end
  # DELETE /orders/1
  # DELETE /orders/1.json
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :ok }
    end
  end
end
