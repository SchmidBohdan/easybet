# frozen_string_literal: true

# Event class
class Event
  attr_accessor :id, :event_type, :event_path_id, :sport_id, :desc, :scoreboard, :markets

  def initialize(hash = {})
    @id = hash['id']
    @event_type = hash['event_type']
    @event_path_id = hash['event_path_id']
    @sport_id = hash['sport_id']
    @desc = hash['desc']
  end
end
