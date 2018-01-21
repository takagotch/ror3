class Message < ApplicationRecord
  has_many_attaced :images

  @message.images.attach(params[:images])
  @message.images.attached?

  #delete
  user.avatar.purge
  user.avatar.purge_later

  #link
  url_for(user.avatar)
  rails_blob_path(usr.avatar, disposition: "attachment")
end

