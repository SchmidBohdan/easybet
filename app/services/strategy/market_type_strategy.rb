# frozen_string_literal: true

module Strategy
  # MarketTypeStrategy class
  class MarketTypeStrategy < BaseStrategy
    class << self
      delegate :call_period, to: '::Strategy::PeriodStrategy'

      def call_market_type(hash = {})
        do_algorithm(hash, MarketType,
                     [
                       { 'periods' => { obj_name: 'periods', delegate_func_name: method(:call_period) } }
                     ])
      end
    end
  end
end
