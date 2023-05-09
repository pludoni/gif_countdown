$:.push File.expand_path("lib", __dir__)

require "gif_countdown/version"

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
  spec.add_dependency 'rmagick', '>= 5.0.0'
  spec.add_runtime_dependency "i18n"
end
