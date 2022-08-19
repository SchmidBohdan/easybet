# frozen_string_literal: true

module Sports
  # FindAllSports class
  class FindAllSports < Base
    attr_reader :relation

    def initialize(hash_obj)
      @relation = hash_obj
    end

    def call
      find_all_sports!

      relation
    end

    def find_all_sports!
      @relation = relation['sports']
    end
  end
end
