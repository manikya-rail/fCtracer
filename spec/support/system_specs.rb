# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:all, type: :system) do
    Capybara.server = :puma, { Silent: true }
  end

  config.before(:each, type: :system) do
    if ENV['SELENIUM_URL'].present?
      # Make the test app listen to outside requests, for the remote Selenium instance.
      Capybara.server_host = '0.0.0.0'
      if ENV['TEST_APP_HOST'].present?
        Capybara.server_port = ENV['TEST_APP_PORT'].to_i
        Capybara.app_host = "http://#{ENV['TEST_APP_HOST']}:#{ENV['TEST_APP_PORT']}"
      end
      # Specify the driver
      driven_by :selenium, using: :headless_chrome, screen_size: [1400, 2000], options: { url: ENV['SELENIUM_URL'] }
      # Get the application container's IP
      ip = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
      # Use the IP instead of localhost so Capybara knows where to direct Selenium
      host! "http://#{ip}:#{Capybara.server_port}"
    else
      driven_by :selenium, using: :headless_chrome
    end
  end
end

# Monkey patch for screenshots not being taken
# @see https://github.com/mattheworiordan/capybara-screenshot/issues/225
require 'action_dispatch/system_testing/test_helpers/setup_and_teardown'
::ActionDispatch::SystemTesting::TestHelpers::SetupAndTeardown.module_eval do
end
