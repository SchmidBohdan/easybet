# frozen_string_literal: true

module Events
  # FindAllSports class
  class BySportId < Base
    attr_accessor :relation, :sport_id

    def initialize(hash_obj, params = {})
      @relation = hash_obj
      @sport_id = params[:sport_id]
    end

    def call
      find_by_sport_id!
      comp_events!

      relation
    end

    private

    def find_by_sport_id!
      @relation = relation['sports'].find { |sport| sport['id'] == sport_id.to_i }
    end

    def comp_events!
      result = []
      @relation = relation['comp'].map { |c| c['events'].each { |e| result << e } }
      @relation = result
    end
  end
end
