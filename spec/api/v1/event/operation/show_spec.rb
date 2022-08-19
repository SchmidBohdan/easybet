# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::Event::Operation::Show, type: :request do
  let(:events) { factory(Api::V1::Event::Operation::Show, { params: { sport_id: '100' } }) }
  before(:each) do
    stub_request(:get, 'https://www.betvictor.com/bv_in_play/v2/en-gb/1/mini_inplay.json')
      .to_return(status: 200, body: Response::Data::MINI_INPLAY, headers: {})
    @model = JSON.parse(events['model'])
  end

  describe '#count_of_events' do
    it 'expect right count of events' do
      expect(@model['data'].count).to eq(2)
    end
  end

  describe '#data_outputs_ids' do
    it 'expect first event id' do
      expect(@model['data'].first['id']).to eq '1770330000'
    end

    it 'expect last event id' do
      expect(@model['data'].last['id']).to eq '1771589700'
    end
  end

  describe '#data_attributes' do
    it 'check if attributes is Hash' do
      expect(@model['data'].first['attributes']).to be_a Hash
    end
  end

  describe '#data_events' do
    it 'expect event type' do
      expect(@model['data'].first['type']).to eq('event')
    end

    it 'expect event_type ' do
      expect(@model['data'].first['attributes']['event_type']).to eq 'GAME_EVENT'
    end

    it 'expect sport id ' do
      expect(@model['data'].first['attributes']['sport_id']).to be == 100
    end
  end

  describe '#data_scoreboard' do
    it 'expect event id in scoreboard object' do
      expect(@model['data'].first['attributes']['scoreboard'].first['e_id']).to be == 1_770_330_000
    end

    it 'expect sport id in scoreboard object' do
      expect(@model['data'].first['attributes']['scoreboard'].first['s_id']).to be == 100
    end
  end

  describe '#data_addresses' do
    it 'expect addresses is Hash' do
      expect(@model['data'].first['attributes']['scoreboard'].first['addresses']).to be_a Hash
    end

    it 'expect addresses is Hash' do
      expect(@model['data'].first['attributes']['desc']).to eq 'Henan Songshan Longmen v Wuhan Three Towns'
    end
  end
end
