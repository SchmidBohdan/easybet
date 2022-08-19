class ApplicationController < ActionController::API
  def healthcheck
    render json: {
      message: 'I am live'
    }
  end
end
