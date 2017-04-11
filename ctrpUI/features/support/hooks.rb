#Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle
require_relative '../support/helper_methods'

Before do
  # Do something before each scenario.
end

Before do |scenario|
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed.
  if $platform == 'android' or $platform == 'iOS'

    if $browser_type == 'native'
      $browser_type = "Browser"
    end

    if $platform == 'android'
      $device_name, $os_version = get_device_info
    end

    desired_caps = {
        caps:       {
            platformName:  $platform,
            browserName: $browser_type,
            versionNumber: $os_version,
            deviceName: $device_name,
            udid: $udid,
            app: ".//#{$app_path}"
        },
    }

    begin
      $driver = Appium::Driver.new(desired_caps).start_driver
    rescue Exception => e
      puts e.message
      Process.exit(0)
    end
  else # else create driver instance for desktop browser
    begin
      $driver = Selenium::WebDriver.for(:"#{$browser_type}")
      $driver.manage().window().maximize()
      $driver.manage.timeouts.page_load = 10 # seconds
      $driver.manage.timeouts.implicit_wait = 10 # seconds
      $driver.manage().delete_all_cookies
    rescue Exception => e
      puts e.message
      Process.exit(0)
    end
  end
end

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.
  close_driver
  if(scenario.failed?)
    #Do something if scenario fails.
  end
end

#Tagged hooks

Before('@Ex_tag1, @Ex_tag2') do
  # This will only run before scenarios tagged
  # with @Ex_tag1 OR @Ex_tag2.
end

AfterStep('@Ex_tag1, @Ex_tag2') do |scenario|
  # This will only run after steps within scenarios tagged
  # with @Ex_tag1 AND @Ex_tag2.
end

Around('@Ex_tag1') do |scenario, block|
  # Will round around a scenario
end

AfterConfiguration do |config|
  # Will run after cucumber has been configured
end

# Quit the selenium driver from the example tests.
at_exit do
  #close_driver
end
