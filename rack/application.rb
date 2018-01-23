config.middleware.use Rack::BounceFavicon
config.middleware.insert_after ActiveRecord::QueryCache, Lifo::Cache, page_cache: false
config.middleware.swap ActiveDispatch::ShowExceptions, Lifo::ShowExceptions

config.middlesware.delete "Rack::Lock"

config.middleware.delete "ActiveDispatch::Cookies"
config.middleware.delete "ActionDispatch::Sesssion::CookieStore"
config.middleware.delete "ActionDispatch::Flash"

config.middle.delete "Rack::MethodOverride"

config.action_dispatch.x_sendfile_header #Rack::Sendfile
config.serve_static_assets :false #ActionDispatch::Static
env["rack.multithread"] :false #Rack::Lock


#$ bin/rails middleware
#=>
#Rake::Sendfile
#ActionDisptach::Static
#Rack::Lock
#
#ActiveSupport::Cache::Strategy::LocalCache::Middleware
#Rack::Runtime
#Rack::MethodOverride params[:_method]
#ActionDispatch::RequestId X-Request-Id
#ActionDispatch::Request#uuid
#Rails::Rack::Logger
#ActionDispatch::ShowExceptions
#ActionDispatch::DebugExceptions 
#ActionDispatch::RemoteIp #IP
#ActionDispatch::Reloader #development prepare,cleanup
#ActionDispatch::Callbacks
#ActiveRecord::Migration::CheckPending #ActiveRecord::PendingMigrationError
#ActiveRecord::ConectionAdapters::ConnectionManagement 
#ActiveRecord::QueryCache
#ActiveDispatch::Session::CookieStore
#ActionDispatch::Flash #config.action_controller.session_store
#ActiveDispatch::ParamsParser
#ActiveDispatch::Head
#Rack::ConditionalGet
#Rake::ETag
#



