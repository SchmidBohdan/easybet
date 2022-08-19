# frozen_string_literal: true

# Scoreboard class
class Scoreboard
  attr_accessor :e_id, :s_id, :clk, :addresses

  def initialize(hash = {})
    @e_id = hash['eId']
    @s_id = hash['sId']
    @clk = hash['clk']
    @stats = hash['stats']
  end
end
