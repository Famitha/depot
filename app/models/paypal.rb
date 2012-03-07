class Paypal < ActiveRecord::Base
  belongs_to :user
  ::TYPE=
{
:visa=>"VISA",
:mastercard=>"MASTER CARD",
:americanexpress=>"AMERICAN EXPRESS"
}
  validates_presence_of :card_no, :message => "must be provided"
  end
