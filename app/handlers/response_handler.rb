# frozen_string_literal: true

module ResponseHandler
  def render_response(result, params = {}, block)
    check_default_policy(result)

    return render_steps_errors(result) if result['step.errors']

    success_operation(result, params, block)
  end

  private

  def success_operation(result, params, block)
    block.present? ? block.call : render_success(result, params)
  end

  def check_default_policy(result)
    raise Errors::ForbiddenError if
      result['result.policy.default']&.failure?
  end

  def render_success(result, params)
    render ResponseSuccessHandler.call(result, params)
  end

  def render_errors(errors, status = nil)
    render ResponseErrorsHandler.call(errors, status)
  end

  def render_steps_errors(result)
    render_errors result['step.errors'].flatten
  end
end
