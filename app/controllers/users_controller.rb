class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find_by(id: current_user.id)
  end

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    return render action: 'new' unless @user.save

    redirect_to root_path, notice: 'Created user'
  end

  private
  def user_params
    params.
      require(:user).
      permit(:username,
             :password,
             :password_confirmation)
  end
end
