Rails.application.routes.draw do
  devise_for :accounts
  HighVoltage.configure do |config|
    config.home_page = 'home'
  end
end
