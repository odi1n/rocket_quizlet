  if ENV['CI']
    Selenium::WebDriver::Chrome.path = '/usr/bin/google-chrome-stable'
  else
    begin
      Selenium::WebDriver::Chrome.path = '/usr/bin/chromium'
    rescue Selenium::WebDriver::Error::WebDriverError
    end
  end
  
  Capybara.register_driver :chrome_root do |app|
      service = ::Selenium::WebDriver::Service.chrome#(args: { verbose: true, log_path: 'chromedriver.log' })
      options = ::Selenium::WebDriver::Chrome::Options.new
      options.args << '--headless' unless ENV['NO_HEADLESS']
      options.args << '--no-sandbox'
      options.args << '--window-size=1280,1024'
  
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, service: service)
  end
  # не работает, установлено выше
  # Capybara::Screenshot.webkit_options = { width: 1280, height: 1024 }
  
  if ENV['CHROME_VISIBLE']
    Capybara.javascript_driver = :selenium_chrome
  else
    Capybara.javascript_driver = :chrome_root
  end
  Capybara.default_driver = :rack_test
  Capybara.default_max_wait_time = 15
  Capybara.register_server :puma do |app, port, host|
    require 'rack/handler/puma'
    Rack::Handler::Puma.run(app, Host: host, Port: port, Threads: "1:1")
  end
  
  Capybara.configure do |config|
    config.app_host = "http://#{Rails.application.secrets.host}"
    config.server = :puma
    config.server_port = 9332
    config.run_server = true
    config.always_include_port = true
  end
  
  
  Capybara::Screenshot.register_driver(:selenium_chrome) do |driver, path|
    driver.browser.save_screenshot(path)
  end
  Capybara::Screenshot.register_driver(:chrome_root) do |driver, path|
    driver.browser.save_screenshot(path)
  end
  
  Capybara::Screenshot.autosave_on_failure = true
  
