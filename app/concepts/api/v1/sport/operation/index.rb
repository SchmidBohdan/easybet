# frozen_string_literal: true

module Api::V1::Sport::Operation
  class Index < Api::BaseOperation
    step :model!

    fail :not_found!

    def model!(ctx, **)
      sports = Sports::FindAllSports.call(Betvictor::Api.request_url_get)
      res = Strategy::SportStrategy.call_sport(sports)
      ctx[:model] = SportSerializer.new(res).serializable_hash.to_json
    end
  end
end
