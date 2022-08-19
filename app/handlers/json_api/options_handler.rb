# frozen_string_literal: true

module JsonApi
  class OptionsHandler
    class << self
      def get_array_params(params)
        params&.delete(' ')&.split(',')
      end

      def get_hash_params(params)
        return unless params

        params.each { |e, m| params[e] = get_array_params(m) }
      end
    end
  end
end
