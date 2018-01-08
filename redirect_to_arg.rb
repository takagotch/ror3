def save
  order = Order.new(params[:order])
  if oreder.save :action => "display"
    redirect_to :action => "display"
  else
    session[:error_count] ||= 0
    session[:error_count] += 1
    if session[:error_count] < 4
      self.notice = "one more"
    else
      redirect_to("/help/order_entry.html")
    end
  end
end

