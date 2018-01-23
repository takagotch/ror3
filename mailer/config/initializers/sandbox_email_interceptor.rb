ActionMailer::Base.register_interceptor(SandboxEmialInterceptor) if Rails.env.staging?

