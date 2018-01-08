def display_cart
  if @cart.empty?
    render(:action => :index)
  else
    #
  end
end

