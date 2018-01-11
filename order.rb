class Order < ActiveResource::Base
	self.site = 'http://ex@ex.com:8080'

	resources :orders do
	  resources :line_items
	end
end

