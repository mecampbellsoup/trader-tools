module BFX
  class OrderHistory
    def initialize(orders)
      @orders = orders.map { |o| BFX::Order.new(o) }
    end

    def analysis
      {
        total_volume: total_volume,
        total_buys: buys.map(&:amount).sum,
        total_sells: sells.map(&:amount).sum,
        weighted_average_buy_price: weighted_average_price(buys),
        weighted_average_sell_price: weighted_average_price(sells),
        total_profit: total_profit
      }
    end

    private

    attr_reader :orders

    def buys
      orders.select { |o| o.type == 'Buy' }
    end

    def sells
      orders.select { |o| o.type == 'Sell' }
    end

    def weighted_average_price(orders)
      orders.inject(0) do |accum, order|
        weighted_price = order.price * (order.amount / total_volume)
        accum += weighted_price
      end
    end

    def total_profit
      # (total buy  volume * weighted average buy  price) -
      # (total sell volume * weighted average sell price)
      (sells.map(&:amount).sum * weighted_average_price(sells)) -
        (buys.map(&:amount).sum * weighted_average_price(buys))
    end

    def total_volume
      orders.map(&:amount).sum
    end

    def count
      orders.size
    end
  end
end
