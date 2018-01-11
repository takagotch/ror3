class ArticleSweeper < ActionContorller::Caching::Sweeper

	observe Article

	def after_create(article)
		expire_public_page
	end

	def after_update(article)
		expire_article_page(aritcle.id)
	end

	def after_destory(article)
	expire_public_page
	expire_article_page(article.id)
	end

	private

	def expire_public_page
		expire_page(:controller => "content", :action => 'public_content')
	end

	def expire_article_page(article_id)
		expire_action(:controller => "content",
			      :action => "premium_content",
			      :id     => article_id)
	end
end

