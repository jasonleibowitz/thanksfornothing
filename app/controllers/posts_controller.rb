class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @teams = Team.all
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.parse_and_save_tags(params[:post][:tags])
      @post.user = current_user
      @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @teams = Team.all
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.valid?
      @post.parse_and_save_tags(params[:post][:tags])
      @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :posts
  end

  private
  def post_params
    params.require(:post).permit(:title, :post_text, :team_id)
  end

end
