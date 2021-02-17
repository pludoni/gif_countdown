if defined?(Rails::Engine)
  require "gif_countdown/engine"
end

require 'gif_countdown/generator'

module GifCountdown
  def self.generate(**args)
    GifCountdown::Generator.new(**args).call
  end
end
