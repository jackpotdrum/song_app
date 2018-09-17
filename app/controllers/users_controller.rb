class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:index, :show, :myimage]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:myimage]}

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  def create
    @user = User.new(name: params[:name],
                     email: params[:email],
                     image_name: "sumtacticon.png",
                     password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def myimage
    @user = User.find_by(id: params[:id])
    if params[:image_name]
      @user.image_name  = "#{@user.id}.png"
      image_name = params[:image_name]
      File.binwrite("public/user_images/#{@user.image_name}", image_name.read)
    end
    if @user.save
      redirect_to("/users/#{@user.id}")
    else
      render("users/show")
    end
  end

  def login_form

  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/login")
  end


  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to("/posts/index")
    end
  end

end
