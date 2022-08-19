# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    include Trailblazer::Rails::Controller
    include ::ResponseHandler
    include ExceptionHelper

    rescue_from StandardError, with: :handle_exception

    def run_and_render(*ctx, &block)
      render_response(run(*ctx), params, block)
    end
  end
end
