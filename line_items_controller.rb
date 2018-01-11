def create
@cart = current_cart
if params[:line_item]
params[:line_item][:order_id] = params[:order_id]
@line_item = LineItem.new(params[:line_item])
else
	product = Product.find(params[:product_id])
	@line_item = @cart.add_product(product.id)
end
respond_to do |format|
if @line_item.save
	format.html { redirect_to store_url }
	format.js   { @current_item = @line_item }
	format.json { render json: @line_item,
	              status: created, location: @line_item }
else
	format.html { render action: "new" }
	format.json { render json: @line_item.errors,
	              status: :unprocessable_entity }
end
end
end

#json
#=> [{"cart_id":null, "created_at":...},
#{...}]

def index
	@line_items = LineItem.all

	respond_to do |format|
	  format.html # index.html.erb
	  format.json { render json: @line_items }
	  format.xml  { render xml: @line_items }
	end
end

#xml
#<?xml version="1.0" encoding="UTF-8"?>
#<line-items type="array">
#<line-items>
#<price type="decimal">49.5</price>
#...
#</line-items>
#...
#</line-items>



