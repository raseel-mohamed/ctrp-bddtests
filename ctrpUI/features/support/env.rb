require 'rubygems'
require 'selenium-cucumber'

# Store command line arguments
$browser_type = ENV['BROWSER'] || 'ff'
$platform = ENV['PLATFORM'] || 'desktop'
$os_version = ENV['OS_VERSION']
$device_name = ENV['DEVICE_NAME']
$udid = ENV['UDID']
$app_path = ENV['APP_PATH']


require 'rspec'
require 'json'
require 'rest-client'
require 'rspec/expectations'
require 'test/unit/assertions'
include Test::Unit::Assertions


base_qa2 = 'https://trials-qa2.nci.nih.gov/'
base_local = 'https://localhost/'
base_aws = 'http://ctrp-po-inttest-elb-1603106388.us-east-1.elb.amazonaws.com:39080/'
base_dataclinicaltrials_ms = 'http://ctrp-inttest-alb-backend-1739456098.us-east-1.elb.amazonaws.com:3100/api/v1/data_clinical_trials/'

#PO Endpoints
po_endpoint = 'po-webservices/services/'

org_endpoint = 'organization-rest-service/organization/'
per_endpoint = 'person-rest-service/person/'
fam_endpoint = 'family-rest-service/'

#PA Endpoints

ENV['choose_ENV'] = 'aws'
ENV['user1'] = 'ctrpqatester1'
ENV['user1_password'] = 'pass'
ENV['dct_usr'] = ''
ENV['dct_pass'] = ''
#put ENV["USER1_ID"]
#put ENV["USER1_PASS"]

# puts 'user name: '+ENV.USER1_ID
# puts 'user pass: '+ENV.USER1_PASS

case ENV['choose_ENV']
  when 'qa2'
    ENV['create_organization'] = base_qa2 + po_endpoint + org_endpoint
    ENV['update_organization'] = base_qa2 + po_endpoint + org_endpoint
    ENV['create_person'] = base_qa2 + po_endpoint + per_endpoint
    ENV['update_person'] = base_qa2 + po_endpoint + per_endpoint
    ENV['search_family'] = base_qa2 + po_endpoint + fam_endpoint
    ENV['dataclinicaltrials_ms'] = base_dataclinicaltrials_ms
  when 'local'
    ENV['create_organization'] = base_local + po_endpoint + org_endpoint
    ENV['update_organization'] = base_local + po_endpoint + org_endpoint
    ENV['create_person'] = base_local + po_endpoint + per_endpoint
    ENV['update_person'] = base_local + po_endpoint + per_endpoint
    ENV['search_family'] = base_local + po_endpoint + fam_endpoint
    ENV['dataclinicaltrials_ms'] = base_dataclinicaltrials_ms
  when 'aws'
    ENV['create_organization'] = base_aws + po_endpoint + org_endpoint
    ENV['update_organization'] = base_aws + po_endpoint + org_endpoint
    ENV['create_person'] = base_aws + po_endpoint + per_endpoint
    ENV['update_person'] = base_aws + po_endpoint + per_endpoint
    ENV['search_family'] = base_aws + po_endpoint + fam_endpoint
    ENV['dataclinicaltrials_ms'] = base_dataclinicaltrials_ms
  else
    puts 'Please choose correct Environment.'
end


# check for valid parameters
validate_parameters $platform, $browser_type, $app_path

# If platform is android or ios create driver instance for mobile browser
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
  rescue Exception => e
    puts e.message
    Process.exit(0)
  end
end
