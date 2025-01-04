class UsersController < ApplicationController
  # GET /users/:id
  def show
    # @user = User.first
    @user = User.find(params[:id])
    # foo  = "foobar"
    # hoge = "hogehoge"
    # debugger

    # => GET app/views/users/show.html.erb
  end

  # GET /users/new or /signup
  def new
    @user = User.new
    # render 'new'
    # => GET app/views/users/new.html.erb
  end

  def create
    # @user = User.new(params[:user])    # 実装は終わっていないことに注意!
    @user = User.new(user_params)
    if @user.save
      # => Success / alert-success
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # => GET /users/:id
      # redirect_to user_path(@user) => GET /user/:id
      # user_path(@user.id)，idが取得される．
    else
      # => Failure
      render 'new', status: :unprocessable_entity
    end
    # paramms => user => user.save => セーブに成功するか失敗するか
  end

  private

    # Strong parameters
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end
end
