config.active_storage.service = :amazon

local:
  service: Disk
  root: <%= Rails.root.join("storage") %>

