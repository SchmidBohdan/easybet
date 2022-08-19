# frozen_string_literal: true

# Sport class
class Sport
  attr_accessor :id, :ep_id, :desc, :pos, :ne, :eic, :v, :ve, :market_types, :comp

  def initialize(result = {})
    @id = result['id']
    @ep_id = result['epId']
    @desc = result['desc']
    @pos = result['pos']
    @eic = result['eic']
    @v = result['v']
    @ve = result['ve']
  end
end
