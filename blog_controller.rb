class BlogController < ApplicationController
expire_fragment(:controller => 'blog', :action => 'list')

def list
	@dynamic_content = Time.now.to_s
end

end

