# frozen_string_literal: true

module Strategy
  # ScoreboardStrategy class
  class ScoreboardStrategy < BaseStrategy
    class << self
      delegate :call_address, to: '::Strategy::AddressStrategy'

      def call_scoreboard(hash = {})
        do_algorithm(hash, Scoreboard,
                     [
                       { 'addresses' => { obj_name: 'addresses', delegate_func_name: method(:call_address) } }
                     ])
      end
    end
  end
end
