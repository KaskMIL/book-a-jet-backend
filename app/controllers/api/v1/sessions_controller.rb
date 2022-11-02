class Api::V1::SessionsController < Devise::SessionsController
  def create
    @user = User.find_by(username: login_params[:username])
    if @user&.valid_password?(login_params[:password])
      @token = @user.issue_token
      render json: { token: @token, username: @user.username,
                     name: @user.name, user_role: @user.role, email: @user.email },
             status: :ok
    else
      render json: { error_message: 'Login failed!', details: 'Email or password is invalid' },
             status: :unprocessable_entity
    end
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end
