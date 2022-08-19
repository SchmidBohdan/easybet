# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::Sport::Operation::Index, type: :request do
  let(:sports) { factory(Api::V1::Sport::Operation::Index) }
  before(:each) do
    stub_request(:get, 'https://www.betvictor.com/bv_in_play/v2/en-gb/1/mini_inplay.json')
      .to_return(status: 200, body: Response::Data::MINI_INPLAY, headers: {})
    @model = JSON.parse(sports['model'])
  end

  describe '#count_of_sports' do
    it 'expect right count of sports' do
      expect(@model['data'].count).to eq(4)
    end
  end

  describe '#data_sport_ids' do
    it 'expect right sport id' do
      expect(@model['data'].first['id']).to eq('100')
    end
  end

  describe '#data_sport_markets' do
    it 'expect if markets is array' do
      expect(@model['data'].first['attributes']['comp'].first['events'].first['markets']).to be_a Array
    end
  end

  describe '#data_sport_market_type' do
    it 'expect if market type exists' do
      expect(@model['data'].first['attributes']['market_types']).not_to be_nil
    end
  end

  describe '#data_sport_comp' do
    it 'expect if comp exists' do
      expect(@model['data'].first['attributes']['comp']).not_to be_nil
    end
  end
end
