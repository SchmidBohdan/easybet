# frozen_string_literal: true

class CollectionErrorsHandler < BaseService
  def initialize(result)
    @result = result
    @result_errors = detect_errors_object
    @messages, @attributes = [], []
  end

  def call
    return unless result_errors

    separate_errors!
    process_message_hash!
  end

  private

  attr_reader :result, :result_errors

  delegate :full_message, to: :result_errors

  def unprocessable_error(field, detail)
    ::Errors::UnprocessableEntity.new(detail: detail, field: field)
  end

  def contract_valid?
    result['contract.default']&.errors&.messages.present?
  end

  def detect_errors_object
    contract_valid? ? result['contract.default']&.errors : result['model']&.errors
  end

  def separate_errors!
    result_errors.each do |attribute, message|
      @attributes.push attribute
      @messages.push full_message(attribute, message)
    end
  end

  def process_message_hash!
    hash_message = @attributes.zip(@messages)
    hash_message.map { |k| unprocessable_error(*k) }
  end
end
