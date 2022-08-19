# frozen_string_literal: true

# Address class
class Address
  attr_accessor :comment, :essential_scoreboard, :essential_scoreboard_callback, :stats, :timeline, :overview_comment

  def initialize(hash = {})
    @comment = hash['comment']
    @essential_scoreboard = hash['essentialScoreboard']
    @essential_scoreboard_callback = hash['essentialScoreboardCallback']
    @stats = hash['stats']
    @timeline = hash['timeline']
    @overview_comment = hash['overviewComment']
  end
end
