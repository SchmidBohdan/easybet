# frozen_string_literal: true

module ExceptionHelper
  def handle_exception(exception)
    log(exception)
    prepared_error = ErrorHandler.call(exception)
    render_errors prepared_error, prepared_error[:status]
  end

  def log(exception)

    Rails.logger.warn exception.message
    Rails.logger.warn exception.backtrace.join('\n')
  end
end
