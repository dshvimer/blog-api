class PostsController < ApplicationController

  def index
    render json: {
      posts: Post.all.map { |post| PostSerializer.new(post) }
    }, status: :ok
  end

  def show
    post = Post.find(params[:id])
    render json: {
      post: PostSerializer.new(post)
    }, status: :ok
  end

  def create
    post = Post.create!(post_params)
    render json: {
      post: PostSerializer.new(post)
    }, status: :created
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: {
      post: PostSerializer.new(post)
    }, status: :ok
  end

  private

  def post_params
    params.require(:post).permit(:id, :body)
  end
end
