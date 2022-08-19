# frozen_string_literal: true

module Api::V1
  class OutcomesController < Api::BaseController
    def index
      run_and_render Outcome::Operation::Show
    end
  end
end
