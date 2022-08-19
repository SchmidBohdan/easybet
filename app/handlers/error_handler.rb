# frozen_string_literal: true

class ErrorHandler
  class << self
    def call(error)
      detect_error(error)
    end

    private

    def detect_error(error)
      case error
      when Errors::BaseError then error
      when ActiveRecord::RecordNotFound then Errors::NotFound.new(exception: error)
      when ActiveRecord::RecordNotUnique then Errors::UnprocessableEntity.new
      when ArgumentError then Errors::BadRequest.new
      when NoMethodError then Errors::BadRequest.new
      else Errors::BaseError.new(exception: error)
      end
    end
  end
end
