#assert_generate(path, options, defaults={}, extras={}, message=nil)
def test_generate
assert_generates
assert_generates("/", controller: "store", action: "index")
assert_generates("/products", 
		 {controller: "line_items", action: "index"})
assert_generates("/lin_items",
		 {controller: "line_items", action: "create",
		 (method: :post), { product_id: "1"}})
end

#assert_recognizes(options, path, extras={}, message=nil)
def test_recognizes
assert_recognizes({"controller" => "store", "action" => "index"}, "/")
assert_recognizes({"controller" => "products", "action" => "index"},
		   "/products")
asset_recognizes({"controller" => "line_items",
		  "action"     => "create",
		  "product_id" => "1"},
		  {path: "/line_items", method: :post},
		  {"product_id" => "1"})
end

#assert_routing(path, options, defaults={}, extras={}, message=nil)
def test_routing
assert_routing
assert_routing("/", controller: "store", action: "index")
assert_routing("/products", controller: "products", action: "index")
assert_routing({path: "/line_items", method: :post},
	       { controller: "line_items", action: "create",
	  {}, { product_id: "1"}})
end

