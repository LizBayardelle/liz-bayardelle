class HomeController < ApplicationController
  def index
    @blogs = Blog.order('created_at DESC').limit(5)
  end
end
