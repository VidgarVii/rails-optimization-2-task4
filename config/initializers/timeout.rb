# initializers/timeout.rb
# Увеличиваем timeout на случай, если ruby-prof сильно замедлит выполнение
if (Rails.env.development? || Rails.env.profile?) && ENV["RACK_TIMEOUT_WAIT_TIMEOUT"].nil?
  ENV["RACK_TIMEOUT_WAIT_TIMEOUT"] = "100000"
  ENV["RACK_TIMEOUT_SERVICE_TIMEOUT"] = "100000"
end

Rack::Timeout.unregister_state_change_observer(:logger) if Rails.env.development?
Rack::Timeout::Logger.disable
