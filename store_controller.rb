class StoreController < ApplicatoinController
layout "standard", except: { :res, :atom }
layout :determine_layout

skip_before_filter :authorize
def index
if params[:set_locale]
	redirect_to store_path(local: params[:set_local])
else
	@products = Product.order(:title)
	@cart = current_cart
end

latest = Product.latest
fresh_when etag: latest
expires_in 10.minutes, public: true
end

def rss
render(layout: false)
end

def checkout
render(layout: "layouts/simple")
end

private
def determine_layout
	if Store.is_closed?
		"store_down"
	else
		"standard"
	end
end

end

