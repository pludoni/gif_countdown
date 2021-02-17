$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "gif_countdown/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "gif_countdown"
  spec.version     = GifCountdown::VERSION
  spec.authors     = ["Stefan Wienert"]
  spec.email       = ["info@stefanwienert.de"]
  spec.homepage    = "https://github.com/pludoni/gif_countdown"
  spec.summary     = "Create a countdown timer animated GIF"
  spec.description = "Create a countdown timer animated GIF"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_development_dependency "rake"
  # spec.add_dependency "rails", "~> 5.2.4", ">= 5.2.4.4"
  spec.add_dependency 'rmagick', '>= 4.0.0'
  spec.add_runtime_dependency "i18n"
end
