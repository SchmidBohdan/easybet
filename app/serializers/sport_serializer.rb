# frozen_string_literal: true

class SportSerializer < BaseSerializer

  attributes :id,
             :ep_id,
             :eic,
             :desc,
             :market_types,
             :comp
end
