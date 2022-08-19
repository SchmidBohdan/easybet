# frozen_string_literal: true

module Outcomes
  # BySportAndEvent class
  class BySportAndEvent < Base
    attr_accessor :relation, :sport_id, :event_id

    def initialize(hash_obj, params)
      @relation = hash_obj
      @sport_id = params[:sport_id]
      @event_id = params[:event_id]
    end

    def call
      find_by_sport_id!
      comp_event!
      markets_outcome!

      relation
    end

    def find_by_sport_id!
      @relation = relation['sports'].find { |sport| sport['id'] == sport_id.to_i }
    end

    def comp_event!
      relation['comp'].each do |c|
        @relation = c['events'].find { |event| event['id'] == event_id.to_i }
        break if @relation
      end
    end

    def markets_outcome!
      result = []
      @relation = relation['markets'].each { |market| market['o'].each { |outcome| result << outcome } }
      @relation = result
    end
  end
end
