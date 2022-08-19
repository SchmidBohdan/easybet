# frozen_string_literal: true


# MarketType class
class MarketType
  attr_accessor :mid, :pos, :desc, :mt_desc, :coupon_name, :headers, :outcome_keys, :periods

  def initialize(result = {})
    @mid = result['id']
    @pos = result['pos']
    @desc = result['desc']
    @mt_desc = result['mtDesc']
    @coupon_name = result['couponName']
    @headers = result['headers']
    @outcome_keys = result['outcomeKeys']
  end
end
