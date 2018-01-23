class CommentChannel < ApplicationCable::Channel
  def subscribed
    post = Post.find(params[:id])
    stream_for post
  end
end

CommentChannel.broadcast_to(@post, @comment)


