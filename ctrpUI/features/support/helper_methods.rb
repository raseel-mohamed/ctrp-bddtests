require 'net/https'
require_relative 'required'

#******************
#
# Click Methods
#
#******************

def click(access_type, access_name)
  $driver.find_element(:"#{access_type}" => "#{access_name}").click
end

def click_by_text(access_type, access_name, text)
  element_found = false
  text_found = false
  text_found = $driver.page_source.include? text
  raise "Text '#{text}' was not found in the page source" unless text_found
  # enter loop if the text is found
  if text_found
    elements = $driver.find_elements(:"#{access_type}" => "#{access_name}")
    elements.each do |element|
      if element.text == text
        element_found = true
        element.click
        break
      end
    end
  end
  raise "Element not found having access type #{access_type}, access name #{access_name}, and text #{text}" unless element_found
end

def click_forcefully(access_type, access_name)
  $driver.execute_script('arguments[0].click();', $driver.find_element(:"#{access_type}" => "#{access_name}"))
end

def double_click(access_type, access_value)
  element = $driver.find_element(:"#{access_type}" => "#{access_value}")
  $driver.action.double_click(element).perform
end

def submit(access_type, access_name)
  $driver.find_element(:"#{access_type}" => "#{access_name}").submit
end

#******************
#
# Input Methods
#
#******************

# method to enter text into textfield
def enter_text(access_type, text, access_name)
  $driver.find_element(:"#{access_type}" => "#{access_name}").send_keys text
end

# method to clear text from textfield
def clear_text(access_type, access_name)
  $driver.find_element(:"#{access_type}" => "#{access_name}").clear
end

# method to select option from dropdwon list
def select_option_from_dropdown(access_type, by, option, access_name)
  dropdown = $driver.find_element(:"#{access_type}" => "#{access_name}")
  select_list = Selenium::WebDriver::Support::Select.new(dropdown)
  select_list.select_by(:"#{by}", "#{option}")
end

# method to select all option from dropdwon list
def select_all_option_from_multiselect_dropdown(access_type, access_name)
  dropdown = $driver.find_element(:"#{access_type}" => "#{access_name}")
  select_list = Selenium::WebDriver::Support::Select.new(dropdown)
  select_list.select_all
end

# method to unselect all option from dropdwon list
def unselect_all_option_from_multiselect_dropdown(access_type, access_name)
  dropdown = $driver.find_element(:"#{access_type}" => "#{access_name}")
  select_list = Selenium::WebDriver::Support::Select.new(dropdown)
  select_list.deselect_all
end

# method to check checkbox
def check_checkbox(access_type, access_name)
  checkbox = $driver.find_element(:"#{access_type}" => "#{access_name}")
  checkbox.click unless checkbox.selected?
end

# method to uncheck checkbox
def uncheck_checkbox(access_type, access_name)
  checkbox = $driver.find_element(:"#{access_type}" => "#{access_name}")

  if checkbox.selected?
    checkbox.click
  end
end

# method to select radio button
def toggle_checkbox(access_type, access_name)
  $driver.find_element(:"#{access_type}" => "#{access_name}").click
end

# method to select radio button
def select_radio_button(access_type, access_name)
  radio_button = $driver.find_element(:"#{access_type}" => "#{access_name}")
  radio_button.click unless radio_button.selected?
end

# method to select option from radio button group
def select_option_from_radio_button_group(access_type, by, option, access_name)
  radio_button_group = $driver.find_elements(:"#{access_type}" => "#{access_name}")

  getter = ->(rb, by) { by == 'value' ? rb.attribute('value') : rb.text }
  ele = radio_button_group.find { |rb| getter.call(rb, by) == option }
  ele.click unless ele.selected?
end

#******************
#
# Assertion Methods
#
#******************

# Method to return page title
def get_page_title
  $driver.title
end

# Method to verify title
# param 1 : String : expected title
# param 2 : Boolean : test case [true or flase]
def check_title(title, test_case)
  page_title = get_page_title

  if test_case
    expect(page_title).to eq title
  else
    expect(page_title).to_not eq title
  end
end

# Method to verify partial title
# param 1 : String : partial title string
# param 2 : Boolean : test case [true or flase]
def check_partial_title(partial_text_title, test_case)
  page_title = get_page_title

  if test_case
    expect(page_title).to include(partial_text_title)
  else
    expect(page_title).to_not include(partial_text_title)
  end
end

# Method to get element text
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : Locator value
def get_element_text(access_type, access_name)
  $driver.find_element(:"#{access_type}" => "#{access_name}").text
end

# Method to check element text
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : Expected element text
# param 3 : String : Locator value
# param 4 : Boolean : test case [true or flase]
def check_element_text(access_type, expected_value, access_name, test_case)
  element_text = get_element_text(access_type, access_name)
  if test_case
    expect(element_text).to eq expected_value
  else
    expect(element_text).to_not eq expected_value
  end
end

# Method to check partial element text
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : Expected element partial text
# param 3 : String : Locator value
# param 4 : Boolean : test case [true or flase]
def check_element_partial_text(access_type, expected_value, access_name, test_case)
  element_text = get_element_text(access_type, access_name)

  if test_case
    expect(element_text).to include(expected_value)
  else
    expect(element_text).to_not include(expected_value)
  end
end

# Method to return element status - enabled?
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : Locator value
def is_element_enabled(access_type, access_name)
  $driver.find_element(:"#{access_type}" => "#{access_name}").enabled?
end

# Element enabled checking
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : Expected element text
# param 4 : Boolean : test case [true or flase]
def check_element_enable(access_type, access_name, test_case)
  result = is_element_enabled(access_type, access_name)
  if test_case
    expect(result).to be true
  else
    expect(result).to be false
  end
end

# method to get attribute value
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : Expected element text
# param 3 : String : atrribute name
def get_element_attribute(access_type, access_name, attribute_name)
  $driver.find_element(:"#{access_type}" => "#{access_name}").attribute("#{attribute_name}")
end

# method to check attribute value
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : atrribute name
# param 3 : String : atrribute value
# param 4 : String : Locator value
# param 5 : Boolean : test case [true or flase]
def check_element_attribute(access_type, attribute_name, attribute_value, access_name, test_case)

  attr_val = get_element_attribute(access_type, access_name, attribute_name)

  if test_case
    expect(attr_val).to eq(attribute_value)
  else
    expect(attr_val).to_not eq(attribute_value)
  end
end

# method to get element status - displayed?
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : Locator value
def is_element_displayed(access_type, access_name)
  begin
    $driver.find_element(:"#{access_type}" => "#{access_name}").displayed?
  rescue Selenium::WebDriver::Error::NoSuchElementError
    # elements not found return false
    false
  end
end

# method to check element presence
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : Locator value
# param 3 : Boolean : test case [true or flase]
def check_element_presence(access_type, access_name, test_case)
  expect(is_element_displayed(access_type, access_name)).to be test_case
end

# method to assert checkbox check/uncheck
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : Locator value
# param 3 : Boolean : test case [true or flase]
def is_checkbox_checked(access_type, access_name, should_be_checked = true)
  checkbox = $driver.find_element(:"#{access_type}" => "#{access_name}")

  expect(checkbox.selected?).to be should_be_checked
end


# method to assert text exists in the dropdown
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : Locator value
# param 3 : String : text to verify in drop down
# param 4 : Boolean : test case [true or flase]
def verify_option_exists_in_dropdown(access_type, access_name, text, test_case)
  ele_exists = $driver.find_element(:"#{access_type}" => "#{access_name}").text.include?(text)
  expect(ele_exists).to eq test_case
end


# method to assert radio button selected/unselected
# param 1 : String : Locator type (id, name, class, xpath, css)
# param 2 : String : Locator value
# param 3 : Boolean : test case [true or flase]
def is_radio_button_selected(access_type, access_name, should_be_selected = true)
  radio_button = $driver.find_element(:"#{access_type}" => "#{access_name}")
  expect(radio_button.selected?).to be should_be_selected
end

# method to assert option from radio button group is selected/unselected
def is_option_from_radio_button_group_selected(access_type, by, option, access_name, should_be_selected = true)
  radio_button_group = $driver.find_elements(:"#{access_type}" => "#{access_name}")

  getter = ->(rb, by) { by == 'value' ? rb.attribute('value') : rb.text }

  ele = radio_button_group.find { |rb| getter.call(rb, by) == option }

  expect(ele.selected?).to be should_be_selected
end

# method to get javascript pop-up alert text
def get_alert_text
  $driver.switch_to.alert.text
end

# method to check javascript pop-up alert text
def check_alert_text(text)
  expect(get_alert_text).to eq text
end

def is_option_from_dropdown_selected(access_type, by, option, access_name, should_be_selected=true)
  dropdown = $driver.find_element(:"#{access_type}" => "#{access_name}")
  select_list = Selenium::WebDriver::Support::Select.new(dropdown)

  if by == 'text'
    actual_value = select_list.first_selected_option.text
  else
    actual_value = select_list.first_selected_option.attribute('value')
  end
  expect(actual_value).to eq option
end

# Method to find difference between images
def does_images_similar?(actual_img_access_type, actual_img_access_name, excp_img_access_type, excp_img_access_name)
  if !compare_image(actual_img_access_type, actual_img_access_name, excp_img_access_type, excp_img_access_name)
    raise TestCaseFailed, 'Actual image is different from expected image'
  end
end

# Method to compare two images
# param 1 : String : Locator type (id, name, class, xpath, css, url)
# param 2 : String : Locator value
# param 3 : String : Locator type (id, name, class, xpath, css, url, image_name)
# param 4 : String : Locator value
def compare_image(actual_img_access_type, actual_img_access_name, excp_img_access_type, excp_img_access_name)
  if actual_img_access_type == 'url'
    actual_img_url = actual_img_access_name
  else
    actual_img_url = get_element_attribute(actual_img_access_type, actual_img_access_name, 'src')
  end

  if excp_img_access_type == 'url'
    expected_img_url = excp_img_access_name
  elsif excp_img_access_type == 'image_name'
    expected_img_url = './features/expected_images/' + excp_img_access_name
  else
    expected_img_url = get_element_attribute(excp_img_access_type, excp_img_access_name, 'src')
  end

  # replace 'https' with 'http' from actual image url
  if actual_img_url.include? 'https'
    actual_img_url['https'] = 'http'
  end

  # replace 'https' with 'http' from expected image url
  if expected_img_url.include? 'https'
    expected_img_url['https'] = 'http'
  end

  if expected_img_url.include? '.png'
    image_type = 'png'
  else
    image_type = 'jpg'
  end

  # Storing actual image locally
  open('./features/actual_images/actual_image.' + image_type, 'wb') do |file|
    file << open(actual_img_url).read
  end

  actual_img_url = './features/actual_images/actual_image.' + image_type

  # Storing Expected image locally
  if excp_img_access_type != 'image_name'
    open('./features/expected_images/expected_image.' + image_type, 'wb') do |file|
      file << open(expected_img_url).read
    end
    expected_img_url = './features/expected_images/expected_image.' + image_type
  end

  # Verify image extension and call respective compare function
  if image_type == 'png'
    return compare_png_images(expected_img_url, actual_img_url)
  end

  compare_jpeg_images(expected_img_url, actual_img_url)
end

# Comparing jpg images
def compare_jpeg_images(expected_img_url, actual_img_url)
  if open(expected_img_url).read == open(actual_img_url).read
    return true
  else
    puts 'Difference in images'
    return false
  end
end

# Comparing png images
def compare_png_images(expected_img_url, actual_img_url)
  images = [
      ChunkyPNG::Image.from_file(expected_img_url),
      ChunkyPNG::Image.from_file(actual_img_url)
  ]

  diff = []

  images.first.height.times do |y|
    images.first.row(y).each_with_index do |pixel, x|
      diff << [x, y] unless pixel == images.last[x, y]
    end
  end

  if diff.length != 0
    puts "\npixels (total):     #{images.first.pixels.length}"
    puts "pixels changed:     #{diff.length}"
    puts "pixels changed (%): #{(diff.length.to_f / images.first.pixels.length) * 100}%"

    x, y = diff.map { |xy| xy[0] }, diff.map { |xy| xy[1] }
    images.last.rect(x.min, y.min, x.max, y.max, ChunkyPNG::Color.rgb(0, 255, 0))
    cur_time = Time.now.strftime('%Y%m%d%H%M%S%L')
    images.last.save("./features/image_difference/difference_#{cur_time}.png")

    puts "\nDifference between images saved as : difference_#{cur_time}.png\n"
    return false
  end
  true
end

#******************
#
# Browser Navigate Methods
#
#******************

def navigate_to(link)
  $driver.get link
end

# method to navigate back & forword
def navigate(direction)
  if direction == 'back'
    $driver.navigate.back
  else
    $driver.navigate.forward
  end
end

# method to quite webdriver instance
def close_driver
  $driver.quit
end

# method to return key (control/command) by os wise
def get_key
  os = $driver.capabilities.platform.to_s.upcase
  if os.to_s == 'WINDOWS' || os.to_s == 'LINUX'
    return 'control'
  elsif os.to_s == 'DARWIN'
    return 'command'
  else
    raise 'Invalid OS'
  end
end

# Method to zoom in/out/reset page
def zoom_in_out(operation)
  if $driver.capabilities.browser_name == 'chrome'
    actual_zoom = $driver.execute_script "return document.body.style.zoom"
    puts "actual_zoom:#{actual_zoom}"
    if actual_zoom == '' or actual_zoom == nil
      actual_zoom = 100
    else
      actual_zoom = actual_zoom.delete '%'
      actual_zoom = actual_zoom.to_i
    end

    if operation == 'add'
      actual_zoom += 15 unless actual_zoom >= 500
    elsif operation == 'subtract'
      actual_zoom -= 15 unless actual_zoom <= 25
    else
      actual_zoom = 100
    end
    puts "actual_zoom:#{actual_zoom}"
    $driver.execute_script "document.body.style.zoom='#{actual_zoom}%'"
  else
    html = $driver.find_element(:tag_name => "body")
    $driver.action.send_keys(html, :"#{get_key}", :"#{operation}" ).perform
  end
end

# Method to zoom in/out web page until web element displyas
def zoom_in_out_till_element_display(access_type, operation, access_name)
  while true
    if WAIT.until { $driver.find_element(:"#{access_type}" => "#{access_name}") }.displayed?
      break
    else
      zoom_in_out(operation)
    end
  end
end

# Method to resize browser
def resize_browser(width, heigth)
  $driver.manage.window.resize_to(width, heigth)
end

# Method to maximize browser
def maximize_browser
  $driver.manage.window.maximize
end

# Method to hover on element
def hover_over_element(access_type, access_name)
  element = $driver.find_element(:"#{access_type}" => "#{access_name}")
  $driver.action.move_to(element).perform
end

# Method to scroll page to perticular element
def scroll_to_element(access_type, access_name)
  ele_scroll = $driver.find_element(:"#{access_type}" => "#{access_name}")
  ele_scroll.location_once_scrolled_into_view
end

# method to scroll page to top or end
def scroll_page(to)
  if to == 'end'
    $driver.execute_script('window.scrollTo(0,Math.max(document.documentElement.scrollHeight,document.body.scrollHeight,document.documentElement.clientHeight));')
  elsif to == 'top'
    $driver.execute_script('window.scrollTo(Math.max(document.documentElement.scrollHeight,document.body.scrollHeight,document.documentElement.clientHeight),0);')
  else
    raise "Exception : Invalid Direction (only scroll \"top\" or \"end\")"
  end
end

# Method to switch to old window
def switch_to_previous_window
  $driver.switch_to.window $previous_window
end

# Method to switch to new window
def switch_to_new_window
  $previous_window = $driver.window_handle
  $driver.switch_to.window($driver.window_handles.last)
end

# Method to switch to main window
def switch_to_main_window
  $previous_window = $driver.window_handle
  $driver.switch_to.window($driver.window_handles.first)
end

# Method to switch to window by title
def switch_to_window_by_title window_title
  $previous_window = $driver.window_handle
  window_found = false
  $driver.window_handles.each{ |handle|
    $driver.switch_to.window handle
    if $driver.title == window_title
      window_found = true
      break
    end
  }
  raise "Window having title \"#{window_title}\" not found" if not window_found
end

def switch_to_window_by_url window_url
  $previous_window = $driver.window_handle
  window_found = false
  $driver.window_handles.each { |handle|
    $driver.switch_to.window handle
    # match absolute or relative
    if $driver.current_url.include?(window_url)
      window_found = true
      break
    end
  }
  raise "Window having url \"#{window_url}\" not found" if not window_found
end

# Method to close new window
def close_new_window
  $driver.close
end

# method to switch frame
def switch_frame frame
  $driver.switch_to.frame(frame)
end

# method to switch to main window
def switch_to_main_content
  $driver.switch_to.default_content
end
