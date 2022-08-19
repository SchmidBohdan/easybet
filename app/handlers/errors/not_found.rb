# frozen_string_literal: true

module Errors
  class NotFound < BaseError
    private

    def error_detail
      exception.message
    end

    def status_code
      404
    end
  end
end
