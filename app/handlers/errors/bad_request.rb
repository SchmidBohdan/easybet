# frozen_string_literal: true

module Errors
  class BadRequest < BaseError
    def error_detail
      'Invalid request body.'
    end

    def status_code
      400
    end
  end
end
