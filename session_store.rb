#config/initializers/session_store.rb
Depot::Application.config.session_store :cookie_store, key: '_depot_session'
#session_store = :cookie_store
#session_store = :active_record_store
#session_store = :mem_cache_store
#
#updated_at
#delete from sessions
#where now() - updated_at > 3600; #1h = %r/60{2}/


