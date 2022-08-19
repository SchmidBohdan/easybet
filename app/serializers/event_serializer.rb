# frozen_string_literal: true

class EventSerializer < BaseSerializer
  attributes :id,
             :event_type,
             :event_path_id,
             :sport_id,
             :desc,
             :scoreboard,
             :markets
end
