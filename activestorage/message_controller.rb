class MessagesController < ApplicationController
  def create
    message = Message.create!(message_params)
    redirect_to message
  end

  private
  def message_params
    prams.require(:message).permit(:title, :content, images: [])
  end
end

