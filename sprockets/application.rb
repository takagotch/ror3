config.assets.version = '1.0'

#cache_store
config.assets.cache_store = :memory_store
config.assets.cache_store = :memory_store, { size: 32.megabytes }
config.assets.configure do |env|
  env.cache = ActiveSupport::Cache.lookup_store(:null_store)
end

