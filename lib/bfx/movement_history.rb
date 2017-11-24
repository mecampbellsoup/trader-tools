module BFX
  class Movement
    attr_reader :currency, :method, :type, :amount, :timestamp

    def initialize(attrs = {})
      @currency  = attrs.fetch('currency')
      @method    = attrs.fetch('method')
      @type      = attrs.fetch('type')
      @amount    = attrs.fetch('amount').to_f
      @timestamp = Time.at(attrs.fetch('timestamp').to_f)
    end
  end

  class MovementHistory
    attr_reader :movements

    def initialize(movements)
      @movements = movements.map { |m| BFX::Movement.new(m) }
    end

    def deposits
      @deposits ||= movements.select { |m| m.type == 'DEPOSIT' }
    end

    def withdrawals
      @withdrawals ||= movements.select { |m| m.type.match(/withdrawal/i) }
    end
  end
end
