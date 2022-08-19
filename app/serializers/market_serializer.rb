# frozen_string_literal: true

class MarketSerializer < BaseSerializer
  attributes :id,
             :desc,
             :eid,
             :pid,
             :outputs
end
