require "test_helper"
require "capybara/cuprite"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :cuprite, screen_size: [1400, 1400],
    options: {
      headless: ENV["HEADLESS_BROWSER_MODE"].blank?,
    }

  def pause
    sleep 2 if ENV["HEADLESS_BROWSER_MODE"].present?
  end

  setup do
    2.times do
      current_window.maximize
    end
  end
end
