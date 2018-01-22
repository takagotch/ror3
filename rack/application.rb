config.action_dispatch.x_sendfile_header #Rack::Sendfile
config.serve_static_assets :false #ActionDispatch::Static
env["rack.multithread"] :false #Rack::Lock
ActiveSupport::Cache::Strategy::LocalCache::Middleware
Rack::Runtime
Rack::MethodOverride params[:_method]
ActionDispatch::RequestId X-Request-Id
ActionDispatch::Request#uuid
Rails::Rack::Logger
ActionDispatch::ShowExceptions
ActionDispatch::DebugExceptions
ActionDispatch::RemoteIp
ActionDispatch::Reloader
ActionDispatch::Callbacks
ActiveRecord::Migration::CheckPending
AcriveRecord::ConectionAdapters::ConnectionManagement
	...



