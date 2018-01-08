Depot::Application.routes.draw do
resources :products do
get :who_bought, on: :member
end
end

resources :products do
	resources :reviews
end

#/products/1         => product_path(1)
#/products/1/reviews => product_reviews_index_path(1)
#/products/2         => review_path(2)

/*routes.rb
*
GET /products(.:format)
{:action => "index", :controller=>"products"}
*
*/

def show
respond_to do |format|
format.html
format.xml { render.xml: @product.to_xml }
format.yaml { render.yaml @product.to_yaml }
end
end

GET HTTP://takagotch.com/store/show/123?format=xml

