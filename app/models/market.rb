# frozen_string_literal: true

# Market class
class Market
  attr_accessor :id, :desc, :eid, :pid, :ptd, :outputs

  def initialize(hash = {})
    @id = hash['id']
    @desc = hash['desc']
    @eid = hash['eid']
    @pid = hash['pid']
  end
end
