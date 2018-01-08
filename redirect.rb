class BlogController
  def display
    @article = Article.find(params[:id])
  end

  def add_comment
    @article = Article.find(params[:id])
    comment = Comment.new(params[:comment])
    @article.comment << comment
    if @article.save
	    flash[:note] = "thx"
    else
	    flash[:note] = "no thx"
    end
    render(:action => 'display')
  end
end

