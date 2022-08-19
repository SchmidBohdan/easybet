# frozen_string_literal: true

module Strategy
  # OutcomeStrategy class
  class OutcomeStrategy < BaseStrategy
    class << self
      def call_output(hash)
        hash.map { |h| Outcome.new(h) }
      end
    end
  end
end
