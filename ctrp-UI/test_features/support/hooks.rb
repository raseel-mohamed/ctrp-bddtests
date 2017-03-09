
Before do
  ENV['BROWSER'] = "chrome" if ENV['BROWSER'].nil?
  #@browser = Selenium::Browser.new ENV['BROWSER'].to_sym
end

After do |scenario|
  if (scenario.failed?)
    @browser.driver.save_screenshot "failed.jpg"
    embed "failed.jpg", 'image/png'
  end
  # @browser.quit
end