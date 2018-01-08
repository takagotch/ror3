def send_secret_file
  send_file("/files/secret_list")
  header["Content-Description"] = "Top secret"
end

