rails new app --skip-sprockets

$RAILS_ENV=production bin/rails assets:precompile
[ Proc.new { |filename, path| path =~ /app\/assets/ && !%w(.js.css).include?(File.extname(filename)) },
/application.(css|js)$/ ]



