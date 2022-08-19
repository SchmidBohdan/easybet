# frozen_string_literal: true

module Errors
  class BaseError < StandardError
    include Virtus.model

    attribute :exception, StandardError
    attribute :status, Integer, default: :status_code
    attribute :detail, String, default: :error_detail
    attribute :error_code, String, default: :code_title
    attribute :error, Hash, default: :simple_error, lazy: true

    private

    def error_detail
      exception.try(:message) || 'Internal Server Error'
    end

    def status_code
      500
    end

    def code_title
      'internal'
    end

    def simple_error
      {
        message: detail
      }
    end
  end
end
