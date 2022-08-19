# frozen_string_literal: true

module Strategy
  # PeriodStrategy class
  class PeriodStrategy < BaseStrategy
    class << self
      delegate :call_config, to: '::Strategy::ConfigStrategy'

      def call_period(hash = {})
        do_algorithm(hash, Period,
                     [
                       { 'config' => { obj_name: 'config', delegate_func_name: method(:call_config) } }
                     ])
      end
    end
  end
end
