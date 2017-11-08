# Require this file to interface with the lib.
# It will require other necessary dependencies in turn,
# e.g. Bitfinex::Client, gems, etc.
#

require 'bundler/setup'
Bundler.require(:default, ENV.fetch('BFX_ENV', 'development'))
require_relative '../config/bitfinex'

Dir[File.dirname(__FILE__) + '/bfx/*.rb'].each { |file| require file }

module BFX
end
