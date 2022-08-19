# frozen_string_literal: true

module Strategy
  # SportStrategy class
  class SportStrategy < BaseStrategy
    class << self
      delegate :call_market_type, to: '::Strategy::MarketTypeStrategy'
      delegate :call_comp, to: '::Strategy::CompStrategy'

      def call_sport(hash = {})
        do_algorithm(hash, Sport,
                     [
                       { 'market_types' => { obj_name: 'marketTypes', delegate_func_name: method(:call_market_type) } },
                       { 'comp' => { obj_name: 'comp', delegate_func_name: method(:call_comp) } }
                     ])
      end
    end
  end
end
