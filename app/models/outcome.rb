# frozen_string_literal: true

# Output class
class Outcome
  attr_accessor :id, :d, :sd, :cpid, :p, :pr

  def initialize(hash = {})
    @id = hash['oid']
    @d = hash['d']
    @sd = hash['sd']
    @cpid = hash['cpid']
    @p = hash['p']
    @pr = hash['pr']
  end
end
