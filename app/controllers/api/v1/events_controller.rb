# frozen_string_literal: true

module Api::V1
  class EventsController < Api::BaseController
    def index
      run_and_render Event::Operation::Show
    end
  end
end
