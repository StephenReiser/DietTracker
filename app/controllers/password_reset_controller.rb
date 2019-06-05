include BCrypt

class PasswordResetController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false
#   before_action :set_user

  def create
    @email = params['email']
    @user = User.where("email": @email)
    @unhashedPW = 'Testing'
    @password = Password.create(@unhashedPW)
    @user.update("password_digest": @password)
    @newUser = User.where("email": @email)
    # @params = params

    render json: {password: @unhashedPW, email: @email}
  end


  private
  # Use callbacks to share common setup or constraints between actions.
#   def set_user
#     @user = User.find(params[:id])
#   end
end
