# frozen_string_literal: true

module Helpers
  module Serializer
    def self.Setup(serializer: nil)
      step = ->((options, _flow_options), **) { serializer!(options, serializer) }
      task = Trailblazer::Activity::TaskBuilder::Binary(step)
      { task: task, id: 'serializer.setup' }
    end

    def self.serializer!(options, serializer)
      options['serializer'] = serializer
    end
  end
end
