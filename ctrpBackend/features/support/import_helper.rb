#require 'active_support/core_ext/hash'

class Import_helper

  def self.trigger_import_post(service, service_url_method, username, password, headers, nct_id)
    service_url = ENV[service_url_method]+nct_id
    @response = Helper.request(service, service_url, username,password, '', headers)
    @response
    @response_code = @response.code
    # @response_body = JSON.parse(@response.body)
    puts @response.code
    puts @response.body
    assert_equal(@response_code.to_s, '200', 'Response code is :' + @response_code.to_s + ' instead of 200 for NCT ID: ' + nct_id)
    return @response, @response_code, @response_body
  end

end