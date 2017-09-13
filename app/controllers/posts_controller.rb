class PostsController < ApplicationController
  # Nested, find in topics
  # def index
  # 	@posts = Post.all
  # end

  def show
    # @topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
  	@post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post updated."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error updating the post. Please try again."
      render :edit
    end
  end

  def create
    @topic = Topic.find(params[:topic_id])
  	@post = Post.new

  	@post.title = params[:post][:title]
  	@post.body = params[:post][:body]
    @post.topic = @topic

  	if @post.save
  		flash[:notice] = "Post uploaded."
  		redirect_to [@topic, @post]
  	else
  		flash.now[:alert] = "There was an error saving the post. Please try again."
    	render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted."
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

end
