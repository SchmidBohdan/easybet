# frozen_string_literal: true

module Strategy
  # EventStrategy class
  class EventStrategy < BaseStrategy
    class << self
      delegate :call_scoreboard, to: '::Strategy::ScoreboardStrategy'
      delegate :call_market, to: '::Strategy::MarketStrategy'

      def call_event(hash = {})
        do_algorithm(hash, Event,
                     [
                       { 'scoreboard' => { obj_name: 'scoreboard', delegate_func_name: method(:call_scoreboard) } },
                       { 'markets' => { obj_name: 'markets', delegate_func_name: method(:call_market) } }
                     ])
      end
    end
  end
end
