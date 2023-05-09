
require 'i18n'
I18n.load_path << File.expand_path('../config/locales/gif_countdown.de.yml', __dir__)
I18n.load_path << File.expand_path('../config/locales/gif_countdown.en.yml', __dir__)

module GifCountdown
  autoload :Generator, 'gif_countdown/generator'
  def self.generate(**args)
    GifCountdown::Generator.new(**args).call
  end
end
