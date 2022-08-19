# frozen_string_literal: true

class OperationError < BaseService
  TYPES = {
    not_found: Errors::NotFound,
    base: Errors::BaseError
  }.freeze

  def initialize(options = {})
    @options = options
  end

  def call
    TYPES[type].new(options)
  end

  private

  attr_reader :options

  def type
    options.fetch(:type, :base)
  end
end
