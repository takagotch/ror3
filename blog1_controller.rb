class BlogController < ApplicationContoroller
def list
	@dynamic_content = Time.now.to_s
	unless fragment_exist?(action: 'list')
		logger.info("")
		@articles = Article.find_recent
	end
end
end


