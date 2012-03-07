class PaypalcontrolsController < ApplicationController
	def new
      @paypalcontrol=Paytable.new
		end
	def create
      p "createnkgvdhfihgifudghuifyhkjhpf"
      
		@paypalcontrol=Paytable.new(params[:paypalcontrol])
		ActiveMerchant::Billing::Base.mode = :test
gateway = ActiveMerchant::Billing::PaypalGateway.new(
      :login => "famith_1326971502_biz_api1.railsfactory.org",
        :password => "1326971540",
        :signature => "AcTwRrZu4h.9uCavRLE9rz9J5F1cAztJH6Or.ShQhLL-TyH0XdEpMd8f"
)
credit_card = ActiveMerchant::Billing::CreditCard.new(
    :type                   => "#{params[:paypal][:card_type]}",
    :number                 => "#{params[:paypal][:card_no]}",
    :verification_value     => "#{params[:paypal][:card_verification]}",
    :month                  => "#{params[:paypal][:expiry_month]}",
    :year                   =>"#{params[:paypal][:expiry_year]}",
    :first_name             => "#{params[:paypal][:fname]}",
    :last_name              => "#{params[:paypal][:lname]}"
		
 
)
p credit_card
@amount="#{params[:paypal][:amount]}"
p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
	#@paypal.save
p @amount
if credit_card.valid?
response = gateway.purchase(@amount.to_i,credit_card,:ip => "127.0.0.1", :billing_address => {
    :name     => "ParthibanAdmin",
    :address1 => "No.11 5th street perambur",
    :city     => "chennai",
    :state    => "Tamilnadu",
    :country  => "India",
    :zip      => "600013"

} )   
if response.success?
    puts "Purchase complete!"
    #@pay.user_id=session[:user_id]
		@paypal.save
       flash[:notice]="your transaction successful"
    redirect_to store_url
  else
         flash[:notice]="Transaction failure!"
    render :new
  end
else
    
       flash[:notice]="Transaction failure!"
  render :new
end

end

end
