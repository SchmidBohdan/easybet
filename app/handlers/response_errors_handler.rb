# frozen_string_literal: true

class ResponseErrorsHandler < BaseService
  def initialize(errors, status = nil)
    @errors = errors
    @status = status
  end

  def call
    {
      json: {
        errors: parse_errors
      },
      status: detect_status
    }
  end

  private

  attr_reader :errors, :status

  def parse_errors
    Array(errors).map(&:error)
  end

  def detect_status
    status || Array(errors)[0].status
  end
end
