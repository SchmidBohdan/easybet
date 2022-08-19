# frozen_string_literal: true

# Comp class
class Comp
  attr_accessor :id, :desc, :pos, :events

  def initialize(hash = {})
    @id = hash['id']
    @desc = hash['desc']
    @pos = hash['pos']
  end
end
