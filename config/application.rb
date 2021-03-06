require_relative 'boot'

require 'rails/all'

require 'payjp'

class MyPayjp
  Payjp::api_key = ENV['PAYJP_PRIVATE_KEY']

  def self.create_token(number, cvc, exp_month, exp_year)
    token = Payjp::Token.create(
      card: {
        number:    number,
        cvc:       cvc,
        exp_year:  exp_year,
        exp_month: exp_month,
      }
    )
    return token.id
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FreemarketSample54a
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
