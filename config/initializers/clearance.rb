Clearance.configure do |config|

  config.allow_sign_up = true
  config.cookie_domain = 'cup.town'
  config.cookie_expiration = lambda { |cookies| 1.year.from_now.utc }
  config.cookie_name = "remember_token"
  config.cookie_path = "/"
  config.routes = true
  config.httponly = false
  config.mailer_sender = 'support@cup.town'
  config.password_strategy = Clearance::PasswordStrategies::BCrypt
  config.redirect_url = '/'
  config.secure_cookie = false
  config.sign_in_guards = []
  config.user_model = User

  Clearance::SessionsController.layout 'landing'
  # Clearance::UsersController.layout 'landing'
end
