class BlogController < ApplicationController
  def index
    render(:template => "blog/short_list")
  end
end

