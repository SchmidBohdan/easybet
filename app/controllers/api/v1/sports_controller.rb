# frozen_string_literal: true

module Api::V1
  class SportsController < Api::BaseController
    def index
      run_and_render Sport::Operation::Index
    end
  end
end
