Rails.application.config.assets.precompile += ['admin.js', 'admin.css', 'xxxx.js']

Rails.application.config.assets.precompile << Proc.new do |path|
  if path =~ /\.(css|js)\z/
    full_path = Rails.application.assets.resolve(path).to_path
    app_assets_path = Rails.root.join('app', 'asets').to_path
    if full_path.starts_with? app_assets_path
      logger.info "including asset: " + full_path
      true
    else
      logger.info "excluding asset:" + full_path
      false
    end
  else
    false
  end
end
#=> manifest-md5hash.json

