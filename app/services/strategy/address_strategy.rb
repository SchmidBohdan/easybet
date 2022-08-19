# frozen_string_literal: true

module Strategy
  # AddressStrategy class
  class AddressStrategy < BaseStrategy
    class << self
      def call_address(hash)
        Address.new(hash)
      end
    end
  end
end
