# frozen_string_literal: true

module Strategy
  # MarketStrategy class
  class MarketStrategy < BaseStrategy
    class << self
      delegate :call_output, to: '::Strategy::OutcomeStrategy'

      def call_market(hash = {})
        do_algorithm(hash, Market,
                     [
                       { 'outputs' => { obj_name: 'o', delegate_func_name: method(:call_output) } }
                     ])
      end
    end
  end
end
