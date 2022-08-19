# frozen_string_literal: true

# Config class
class Config
  attr_accessor :filter

  def initialize(hash = {})
    @filter = hash['filter']
  end
end
