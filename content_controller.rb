class ContentController < ApplicationController
	before_filter :verify_premium_user, :except => :public_content

	caches_page :public_content
	cache_action :premuim_content

	cache_sweeper :article_sweeper,
		      :only => [ :create_article,
	                         :update_article,
	                         :delete_article ]

	def public_content
		@articles = Article.list_public
	end

	def premium_content
		@articles = Article.list_premium
	end

	private
	def verify_premium_user
	user = session[:user_id]
	user = User.find(user) if user
	unless user && user.active?
	redirect_to :controller => "login", :action => "signup_new"
	end
	end

	def create_article
		article = Article.new(params[:article])
		if article.save
			expire_page :action => "public_content"
		else
			#...
		end
	end

	def update_article
		article = article.find(params[:id])
		if article.update_attributes(params[:article])
			expire_action :action => "premium_content", :id => article
		else
			#...
		end
	end

	def delete_article
		Article.destroy(params[:id])
		expire_page :action => "public_content"
		expire_action :action => "premium_content", :id => params[:id]
	end


end

