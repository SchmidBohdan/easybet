# frozen_string_literal: true

# frozen_string_literal: true
class ResponseSuccessHandler < BaseService
  def initialize(result, params)
    @result = result
    @params = params
    @fields = params.permit(fields: {})[:fields].to_h unless params.empty?
  end

  def call
    {
      json: serialized_object,
      serializer: result['serializer'],
      status: :ok,
      adapter: params[:adapter]
    }.merge(json_api_options).compact
  end

  def serialized_object
    return result['model'] unless result['serializer']

    result['serializer'].new(result['model'], json_api_options).serializable_hash.to_json
  end

  def json_api_options
    {
      meta: Hash(result['meta']),
      include: JsonApi::OptionsHandler.get_array_params(params[:include]),
      fields: JsonApi::OptionsHandler.get_hash_params(fields)
    }
  end

  private

  attr_reader :result, :params, :fields
end
