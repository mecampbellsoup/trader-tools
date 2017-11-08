require 'bitfinex-rb'

Bitfinex::Client.configure do |conf|
  conf.secret  = ENV["BITFINEX_API_SECRET"]
  conf.api_key = ENV["BITFINEX_API_KEY"]
  # NOTE: v2 API is still in beta so not using it yet...
  #conf.use_api_v2
end
