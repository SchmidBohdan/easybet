# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::Outcome::Operation::Show, type: :request do
  let(:outcomes) { factory(Api::V1::Outcome::Operation::Show, { params: { sport_id: '100', event_id: '1770330000' } }) }
  before(:each) do
    stub_request(:get, 'https://www.betvictor.com/bv_in_play/v2/en-gb/1/mini_inplay.json')
      .to_return(status: 200, body: Response::Data::MINI_INPLAY, headers: {})
    @model = JSON.parse(outcomes['model'])
  end

  describe '#count_of_outcome' do
    it 'expect right count of outcomes' do
      expect(@model['data'].count).to eq(3)
    end
  end

  describe '#data_outputs_ids' do
    it 'expect first id' do
      expect(@model['data'].first['id']).to eq('117140979000')
    end

    it 'expect last id' do
      expect(@model['data'].last['id']).to eq('117140978800')
    end
  end

  describe '#data_output_type' do
    it 'expect properly type' do
      expect(@model['data'].first['type']).to eq('outcome')
    end
  end

  describe '#data_output_attributes' do
    it 'expect attribute object' do
      expect(@model['data'].first['attributes']).to be_a Hash
    end

    it 'expect description is string ' do
      expect(@model['data'].first['attributes']['d']).to be_a String
    end

    it 'expect description is string ' do
      expect(@model['data'].first['attributes']['d']).to be_a String
    end
  end
end
