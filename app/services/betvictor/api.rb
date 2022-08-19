# frozen_string_literal: true

require 'httparty'
require 'json'
require "logger"

module Betvictor
  # Api class
  class Api
    class << self
      URL = 'https://www.betvictor.com/bv_in_play/v2/en-gb/1/mini_inplay.json'
      ATTEMPT = 5

      def request_url_get
        (1..ATTEMPT).each do |count|
          logger.info "Attempt #{count} make request to #{URL}"
          return cache_result
        rescue StandardError => e
          error_response(e, count)
        end
      end

      private

      def cache_result
        Rails.cache.fetch('betvictor_result', expires_in: 1.hours) do
          JSON.parse(HTTParty.get(URL).body)
        end
      end

      def error_response(err, count)
        logger.error "Failed to make request to #{URL}. Check proxy server!!!!"
        raise Errors::BaseError.new(exception: err) if count == 5
      end

      def logger
        Logger.new(STDOUT)
      end
    end
  end
end
