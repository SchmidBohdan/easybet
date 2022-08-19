# frozen_string_literal: true

module Api::V1::Event::Operation
  class Show < Api::BaseOperation
    step :model!

    fail :not_found!

    def model!(ctx, params:, **)
      events = Events::BySportId.call(Betvictor::Api.request_url_get, params)
      res = Strategy::EventStrategy.call_event(events)
      ctx[:model] = EventSerializer.new(res).serializable_hash.to_json
    end
  end
end
