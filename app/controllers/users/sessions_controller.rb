class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
  layout 'sessions'
  skip_before_action :authenticate_user!

  # GET /resource/sign_in
  def new
    @user = User.new
  end

  # POST /resource/sign_in
  def create
    @user = User.find_by(phone: user_params[:phone])

    if @user && @user.valid_password?(user_params[:password])
      sign_in(@user)
      # sign_in(@user)
      # flash[:success] = '登录成功'
      # redirect_to blogs_path
      data = {code: 0, msg: "登录成功", url: root_path}
    else
      # flash[:danger] = '账户密码不正确，请重试!'
      # redirect_to  root_path
      data = {code: -1, msg: "账户密码不正确，请重试!"}
    end

    render json: data
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private
  def user_params
    params.require(:user).permit(:phone, :password)
  end
end
