require 'csv'

# This script assumes that you have downloaded a ledger of all activity for
# a certain currency, e.g. BTC, BT2, BT1, ETH, etc. Bitfinex makes those
# reports available for download at: https://www.bitfinex.com/reports.
# Only trade (as in "exchange") activities are used since this script is
# intended to calculate one's weighted average trade price.

class Trade
  #{"Currency"=>"BT2",
   #"Description"=>"Exchange 0.39360403 BT2 for BTC @ 0.10769 on Exchange wallet",
   #"Amount"=>"-0.39360403",
   #"Balance"=>"0.0",
   #"Date"=>"2017-10-13 21:09:34"}
  #
  def initialize(attributes)
    @description = attributes["Description"]
    @amount = attributes["Amount"].to_f
    @date = DateTime.parse(attributes["Date"])
    @currency = attributes["Currency"]
  end

  def price
    @price ||= description.split[6].to_f
  end

  def buy?
    amount > 0
  end

  attr_reader :description, :amount, :date, :currency
end

# trade activity CSV passed via ARGV
filepath = ARGV[0]

# read in the CSV
rows = CSV.read(filepath, headers: true)

# iterate over each row
trades = rows.map do |row|
  description = row["Description"]
  next unless description.match(/\AExchange/)
  Trade.new(row)
end.compact

total_volume = trades.map(&:amount).sum

weighted_average_price = trades.inject(0) do |accum, trade|
  weighted_price = trade.price * (trade.amount / total_volume)
  accum += weighted_price
end

puts "Weighted average price for #{trades.first.currency}: #{weighted_average_price}."
