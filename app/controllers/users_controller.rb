class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to MyApp #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @user_articles = @user.paginate(page: params[:page], per_page: 5)
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
