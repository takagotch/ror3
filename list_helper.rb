<%= distance_of_time_in_words(Time.now, Time.local(2018, 01, 11)) %>
<%= distance_of_time_in_words(Time.now, Time.now + 33, false) %>
<%= distance_of_time_in_words(Time.now, Time.now + 33, true ) %>
<%= time_ago_in_words(Time.local(2018,01, 24)) %>
<%= number_to_currency(123.45) %>
<%= number_to_currency(234.56, unit: "CAN$", precision: 0) %>
<%= number_to_human_size(123_456) %>
<%= number_to_percentage(66.66666) %>
<%= number_to_percentage(66.66666, precision: 1) %>
<%= number_to_phone(2125551212) %>
<%= number_to_phone(2123331212, area_code: true, delimiter: " ") %>
<%= number_to_delimiter(12345678) %>
<%= number_with_delimiter(12345678, delimiter: "-") %>
<%= number_with_precision(50.0/3, precision: 2) %>

<%= debug(params)%>
<%= simple_format(@trees) %>
<%= excerpt(@trees, "lovely, 8") %>
<%= highlight(@trees, "tree") %>
<%= truncate(@trees, length: 20) %>
<%= pluralize(1, "person") %> but <%= pluralize(2, "person") %>

<%= link_to "delete", product_path(@product),
	{ class: "dangerous", method: 'delete' }%>
<%= link_to "delete", product_path(@product),
	{ class: "danferous",
	  confirm: "Are you sure?",
          method: :delete}
%>
//
<ul>
<% %w{ create list edit save logout }.each do |action| %>
<li>
<%= link_to_unless_current(action.capitalize, action: action) %>
</li>
<% end %>
</ul>
//
<%= image_tag("/images/log.png", class: "bevel", size: "80x120") %>
<%= image_tag("/images/icon.png', class: "bevel", size: "50x22"),
		{confirm: "Are you sure?",
		method: :delete} %>
<%= mail_to("support@ex.com", "contact",
		subject: "#{@user.name}",
	     encode: "javascript") %>

//app/views/xxx.html.erb
<!DOCTYPE html>
<html>
<head>
<%= auto_discovery_link_tag(:atom, products_url(format: 'atom') )%>
<title>Form: <%= controller.action_name %></title>
<%= stylesheet_link_tag "application" %>
<%= javascript_include_tag "application" %>
<%= csrf_meta_tags %>
</head>
<body>
<%= yield :layout %>
<h1><%= @msg %></h1>
</body>
</html>
//config/routes.rb
	config.action_controller.asset_host = "http://media.my.url/assets"
//

