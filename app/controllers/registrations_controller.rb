class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!, only: %i[create new]

  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save

    render_resource resource
  end

  def new
    super
  end

  def update
    super
  end

  private

  def sign_up_params
    params.permit(
      :birthdate, :height, :weight, :scholarity,
      :profession, :transportation, :neighborhood,
      :smoker, :take_meds, :username, :password
    )
  end
end