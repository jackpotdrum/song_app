class PostsController < ApplicationController

  before_action :authenticate_user


  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @like_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      content_music: params[:content_music],
      content_image: "sumtacticon.png",
      user_id: @current_user.id
    )
    if params[:content_music]
      @post.content_music = "#{@post.content}.mp3"
      content_music = params[:content_music]
      File.binwrite("public/content_music/#{@post.content_music}", content_music.read)
    end
    if params[:content_image]
      @post.content_image = "#{@post.content}.png"
      content_image = params[:content_image]
      File.binwrite("public/jacket_images/#{@post.content_image}", content_image.read)
    end
    if @post.save
      flash[:notice] = "投稿が完了しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end

end
