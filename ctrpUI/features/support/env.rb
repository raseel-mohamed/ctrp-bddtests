require 'rubygems'
require 'selenium-cucumber'
# require 'rspec'
# require 'json'
# require 'rest-client'
# require 'rspec/expectations'
# require 'test/unit/assertions'
# include Test::Unit::Assertions

# Store command line arguments
$browser_type = ENV['BROWSER'] || 'ff'
$platform = ENV['PLATFORM'] || 'desktop'
$os_version = ENV['OS_VERSION']
$device_name = ENV['DEVICE_NAME']
$udid = ENV['UDID']
$app_path = ENV['APP_PATH'] || '/Users/ramaniv/Documents/chromedriver2-9'

#base url
base_int_pa = 'http://ctrp-pa-inttest-elb-330752222.us-east-1.elb.amazonaws.com:18080/'
base_local_pa = 'http://localhost:39480/'
base_int_po = 'http://ctrp-po-inttest-elb-1603106388.us-east-1.elb.amazonaws.com:39080/'
base_local_po = 'http://localhost:39080/'
base_uat_pa = 'http://ctrp-pa-uat-elb-872610571.us-east-1.elb.amazonaws.com:18080/'
base_uat_po = 'http://ctrp-po-uat-elb-1842717871.us-east-1.elb.amazonaws.com:39080/'


#app
pa_app = 'pa/'
registry_app = 'registry/'
accrual_app = 'accrual/'
po_app = 'po-web/'

ENV['APP_ENV_SELECT'] = 'aws'

case ENV['APP_ENV_SELECT']
  when 'local'
    ENV['PO_APP'] = base_local_po + po_app
    ENV['PA_APP'] = base_local_pa + pa_app
    ENV['REG_APP'] = base_local_pa + registry_app
    ENV['ACCRUAL_APP'] = base_local_pa + accrual_app
  when 'aws'
    ENV['PO_APP'] = base_int_po + po_app
    ENV['PA_APP'] = base_int_pa + pa_app
    ENV['REG_APP'] = base_int_pa + registry_app
    ENV['ACCRUAL_APP'] = base_int_pa + accrual_app
  when 'uat'
    ENV['PO_APP'] = base_uat_po + po_app
    ENV['PA_APP'] = base_uat_pa + pa_app
    ENV['REG_APP'] = base_uat_pa + registry_app
    ENV['ACCRUAL_APP'] = base_uat_pa + accrual_app
  else
    puts 'Please choose correct Environment.'
end

# check for valid parameters
validate_parameters $platform, $browser_type, $app_path

# If platform is android or ios create driver instance for mobile browser
# if $platform == 'android' or $platform == 'iOS'
#
#   if $browser_type == 'native'
#     $browser_type = "Browser"
#   end
#
#   if $platform == 'android'
#     $device_name, $os_version = get_device_info
#   end
#
#   desired_caps = {
#     caps:       {
#       platformName:  $platform,
#       browserName: $browser_type,
#       versionNumber: $os_version,
#       deviceName: $device_name,
#       udid: $udid,
#       app: ".//#{$app_path}"
#       },
#     }
#
#   begin
#     $driver = Appium::Driver.new(desired_caps).start_driver
#   rescue Exception => e
#     puts e.message
#     Process.exit(0)
#   end
# else # else create driver instance for desktop browser
#   begin
#     $driver = Selenium::WebDriver.for(:"#{$browser_type}")
#     $driver.manage().window().maximize()
#   rescue Exception => e
#     puts e.message
#     Process.exit(0)
#   end
# end
