require 'rack'

app = Proc.new do |env|
  ['200', {'Content-Type' => 'text./html'}, ['A varebones rack app.']]
end

Rack::Handler::WEBrick.run app

