require 'test_helper'

# Register driver
Capybara.register_driver :root_headles_chrome do |app|
  driver_options = Selenium::WebDriver::Chrome::Options.new
  driver_options.options[:args] = [
    'headless',
    'disable-gpu',
    'no-sandbox',
    'disable-dev-shm-usage',
    'whitelisted-ips'
  ]
  driver_options.logging_prefs = { browser: 'ALL' }

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: driver_options
  )
end

require 'support/with_clues'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include TestSupport::WithClues

  driven_by :rack_test
end

# Use this as the base class for system tests that require
# JavaScript or that otherwise need a real browser
class BrowserSystemTestCase < ApplicationSystemTestCase
  driven_by :root_headles_chrome, screen_size: [1400, 1400]
end
