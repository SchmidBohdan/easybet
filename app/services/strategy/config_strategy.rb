# frozen_string_literal: true

module Strategy
  # ConfigStrategy class
  class ConfigStrategy < BaseStrategy
    class << self
      def call_config(hash = {})
        Config.new(hash)
      end
    end
  end
end
