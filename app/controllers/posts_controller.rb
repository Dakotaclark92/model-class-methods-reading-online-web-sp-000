class PostsController < ApplicationController

  def index
    @author = Author.all
    
    if !params[:author].blank? @posts = Post.by_author(params[:author])
    elsif !params[:date].blank?
      if params[:date] == "Today" @posts = Post.from_today
      else
        @post = Post.old_news
      end
    else
      @post = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params)
    @post.save
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post))
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end
end
