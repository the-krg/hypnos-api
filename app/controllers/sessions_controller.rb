class SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!, only: %i[create]

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      id: resource.id,
      username: resource.username,
      success: true,
      access_token: current_token,
      token_type: 'Bearer',
      expires_in: 3600
    }
  end

  def respond_to_on_destroy
    head :no_content
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end