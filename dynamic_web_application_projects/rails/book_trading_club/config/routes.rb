Rails.application.routes.draw do
  HighVoltage.configure do |config|
    config.home_page = 'home'
  end
end
