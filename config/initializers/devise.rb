# frozen_string_literal: true

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  # config.secret_key = '3e5a8ebeb722351a46b92934b30489616e9cd7ed13c4baec26f56c34bdf5ca0bcc84d37b1e0d584fa34892418e9e98b402def5f716640145c53d7761c763d215'

  require 'devise/orm/active_record'

  config.authentication_keys = [:username]
  config.strip_whitespace_keys = [:username]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.navigational_formats = []

  config.jwt do |jwt|
    jwt.secret = ENV['DEVISE_JWT_SECRET']
    jwt.dispatch_requests = [
      ['POST', %r{^/login$}]
    ]
    jwt.revocation_requests = [
      ['DELETE', %r{^/logout$}]
    ]
    jwt.expiration_time = 3600
  end
end
