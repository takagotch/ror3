class SomeController < ApplicationController
if Rails.env.development?
	def method.missing(name, *args)
	render(:inline => %{
	<h2>#{name}</h2>
	<br/>:
	<%= debug(params) %>})
	end
end
end

