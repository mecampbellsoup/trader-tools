## Bitfinex::Order
# Instances of this class represent a single historical order executed or placed
# via the Bitfinex exchange API. As such, we can put validations on these instances,
# e.g. must have a unique order ID.
##

#{
  #"price"=>"0.24016",
  #"amount"=>"0.22",
  #"timestamp"=>"1506608167.0",
  #"type"=>"Sell",
  #"fee_currency"=>"BTC",
  #"fee_amount"=>"-0.00010567",
  #"tid"=>74889813,
  #"order_id"=>4241155519
#}

module BFX
  class Order
    attr_reader :price, :amount, :timestamp, :type,
      :fee_currency, :fee_amount, :order_id, :tid

    def initialize(attrs = {})
      @price        = attrs.fetch('price').to_f
      @amount       = attrs.fetch('amount').to_f
      @timestamp    = Time.at(attrs.fetch('timestamp').to_f)
      @type         = attrs.fetch('type')
      @fee_currency = attrs.fetch('fee_currency')
      @fee_amount   = attrs.fetch('fee_amount')
      @order_id     = attrs.fetch('order_id')
      @tid          = attrs.fetch('tid')
    end
  end
end
