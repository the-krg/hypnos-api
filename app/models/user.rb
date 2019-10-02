class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

  validates :username, uniqueness: true

  has_many :days
  has_many :nights

  private

  def sign_up_params
    params.require(:user).permit(
      :birthdate, :height, :weight, :scholarity, 
      :profession, :transportation, :neighborhood, 
      :smoker, :take_meds
    )
  end
end
