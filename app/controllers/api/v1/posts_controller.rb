class Api::V1::PostsController < Api::V1::BaseController

  before_filter :authenticate_user
  before_filter :authorize_user

  def index
    posts = Post.all
    render json: posts.to_json, status: 200
  end

  def show
    post = post.find(params[:id])
    render json: post.to_json, status: 200
  end

  def update
    post = post.find(params[:id])

    if post.update_attributes(post_params)
      render json: post.to_json, status: 200
    else
      render json: {error: "Post updated failed", status: 400}, status: 400
    end
  end

  def create
    post = Post.new(post_params)

    if post.valid?
      post.save!
      render json: post.to_json, status: 201
    else
      render json: {error: "Post is invalid", status: 400}, status: 400
    end
  end

  def destroy
    post = Post.find(params[:id])

    if post.destroy
      render json: {message: "Post destroyed", status: 200}, status: 200
    else
      render json: {error: "Post destroy failed", status: 400}, status: 400
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :public)
  end

end
