AUTH_SERVICE = if Rails.env.production?
         RealAuthService
       else
         MockedAuthService
       end

