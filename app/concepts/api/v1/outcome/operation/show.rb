# frozen_string_literal: true

module Api::V1::Outcome::Operation
  class Show < Api::BaseOperation
    step :model!

    fail :not_found!

    def model!(ctx, params:, **)
      outcomes = Outcomes::BySportAndEvent.call(Betvictor::Api.request_url_get, params)
      res = Strategy::OutcomeStrategy.call_output(outcomes)
      ctx[:model] = OutcomeSerializer.new(res).serializable_hash.to_json
    end
  end
end
