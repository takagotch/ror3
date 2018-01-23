class ChatChannel < ApplicationCable::Channecl
  def subscribed
    stream_from "chat_#{params[:room]}"
  end
end

