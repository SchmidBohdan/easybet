# frozen_string_literal: true

module Strategy
  # CompStrategy class
  class CompStrategy < BaseStrategy
    class << self
      delegate :call_event, to: '::Strategy::EventStrategy'

      def call_comp(hash = {})
        do_algorithm(hash, Comp,
                     [
                       { 'events' => { obj_name: 'events', delegate_func_name: method(:call_event) } }
                     ])
      end
    end
  end
end
