# frozen_string_literal: true

# Period class
class Period
  attr_accessor :desc, :long_desc, :p_ids, :config

  def initialize(result = {})
    @desc = result['desc']
    @long_desc = result['longDesc']
    @p_ids = result['pIds']
  end
end
