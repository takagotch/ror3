require "sprockets/railtie"

config.generators do |g|
  g.assets false
end

config.assets.paths << Rails.root.join("lib", "videoplayer", "flash")

