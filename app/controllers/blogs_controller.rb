class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @blogs = Blog.tagged_with(params[:tag])
    else
      @blogs = Blog.order(created_at: :desc)
    end
  end

  def show
    @blog = Blog.friendly.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    if @blog.save
      redirect_to blog_path(@blog)
      flash[:notice] = "Your blog has been saved!"
    else
      render controller: :blogs, action: :new
    end
  end

  def edit
    @blog = Blog.friendly.find(params[:id])
  end

  def update
    @blog = Blog.friendly.find(params[:id])
    if @blog.update_attributes(blog_params)
      redirect_to blog_path(@blog)
      flash[:notice] = "Your blog has been saved!"
    else
      render controller: :blogs, action: :edit
    end
  end

  def destroy
    @blog = Blog.friendly.find(params[:id])
    if @blog.destroy
      redirect_to blogs_path
      flash[:notice] = "Blog-be-gone!"
    else
      render controller: :blogs, action: :destroy
    end
  end

  def tagged
    if params[:tag].present?
      @blogs = Blog.tagged_with(params[:tag])
    else
      @blogs = Blog.blogall
    end
  end

  private

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end


  def blog_params
    params.require(:blog).permit(:title, :teaser, :body, :user, :slug, :tag_list)
  end
end
