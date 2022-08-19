# frozen_string_literal: true

module Api
  class BaseOperation < ::Trailblazer::Operation
    def add_error(ctx, options = {})
      ctx['step.errors'] ||= []
      ctx['step.errors'] << create_error(options)
    end

    def create_error(options)
      OperationError.call(options)
    end

    def add_serializer_params(key, value, **)
      self['serializer_params'] = Hash(self['serializer_params']).merge(key => value)
    end

    def not_found!(ctx, **)
      add_error(ctx, type: :not_found, detail: 'Sorry, no data found')
    end
  end
end
