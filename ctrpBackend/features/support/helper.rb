require 'rspec'
require 'json'
require 'rest-client'
class Helper

  def self.request(service, url, username, password, payload, headers)
    service = service.upcase
    method = case service
               when 'POST'
                 :post
               when 'PUT'
                 :put
               when 'GET'
                 :get
               when 'DELETE'
                 :delete
             end
    begin
      @response = RestClient::Request.execute(:url => url, :user => username, :password => password, :method => method, :payload => payload, :headers => headers)
    rescue StandardError => e
      @response = e.response
    end
  end

  def self.rest_call(url, username, password, payload, headers, method)
    begin
      @response = RestClient::Request.execute(:url => url, :user => username, :password => password, :method => method, :payload => payload, :headers => headers)
    rescue StandardError => e
      puts e.to_s
    end
  end


end
