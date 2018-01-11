class Blog2Controller < ApplicationController
	expire_fragment(%r{/blog2/list.*})

	def list
		@dyanamic_content = Time.now.to_s
		@articles = Article.find_recent
		@article_count    = @articles.size
	end

	def edit
		expire_fragment(:action => 'list', :part => 'articles')
		redirect_to(:action => 'list')
	end

	def delete
	expire_fragment(:action => 'list', :part => 'articles')
	expire_fragment("action => 'list', :part => 'counts')
	redirect_to(:action => 'list')
	end
end

