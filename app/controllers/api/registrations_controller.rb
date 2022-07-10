class Api::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  def create
    user = User.new(user_params)

    if validate_password(user)
      user.save!
      render json: { token: JsonWebToken.encode(sub: user.id) }
    else
      warden.custom_failure!
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  private

  def validate_password(user)
    pw = user_params[:password]
    if pw && pw.length < 6
      (user.errors[:password] ||= []) << 'é muito curta (mínimo: 6)'
      false
    else
      true
    end
  end

  def user_params
    params.required(:user)
          .permit(:email, :password)
  end
end
