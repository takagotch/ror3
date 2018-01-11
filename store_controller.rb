class StoreController < ApplicatoinController
layout "standard", except: { :res, :atom }
layout :determine_layout

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

