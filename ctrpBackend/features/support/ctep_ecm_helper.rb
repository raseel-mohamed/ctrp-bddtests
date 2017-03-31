require 'rspec'
require 'json'
require 'rest-client'

class CTEPecm_helper


  def self.trigger_get_ro(service, service_url_method, headerss, org_id)
    service_url = ENV['base_ctepecm_ms'] = base_ctepecm_ms + ecm_endpoint_ro
    @response = Helper.request(service, service_url,  nil, headers)
    @response
    @response_code = @response.code
    @response_body = JSON.parse(@response.body)
    @id = @response_body['id']
    puts ' ID is: ' + @id.to_s
    return @response, @response_code, @response_body, @id
  end

end