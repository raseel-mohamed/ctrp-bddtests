
class Helper

  def self.request(service, url, username, password, payload, headers)
    service = service.upcase
    case service
      when 'POST'
        @response = RestClient::Request.execute(:url => url, :user => username, :password => password, :method => :post, :payload => payload, :headers => headers)
      when 'GET'
        @response = RestClient::Request.execute(:url => url, :user => username, :password => password, :method => :get, :headers => headers)
      when 'PUT'
        @response = RestClient::Request.execute(:url => url, :user => username, :password => password, :method => :put, :payload => payload, :headers => headers)
      else
        flunk 'Please choose correct service. Provided service ' + service + 'does not exist'
    end
  end


end
