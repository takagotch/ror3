require ::File.expand_path('../config/environment'. __FILE__)
use Rails::Rack::Debugger
use Rack::ContentLength
run Rails.application

run Proc.new {|env| ['200', {'Content-Type' => 'text/html'}, ['get rack\'d'']] }


