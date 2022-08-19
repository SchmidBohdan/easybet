# frozen_string_literal: true

require "logger"

class BaseService
  def self.call(*args)
    new(*args).call
  end

  def logger
    Logger.new(STDOUT)
  end
end
