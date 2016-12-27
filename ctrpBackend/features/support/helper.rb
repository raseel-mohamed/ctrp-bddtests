
class Helper

  def self.request(service, url, user, payload, headers)
    service = service.upcase
    case service
      when 'POST'
        @response = RestClient::Request.execute(:url => url, :user => user, :password => 'Welcome@1', :method => :post, :payload => payload, :headers => headers)
      when 'GET'
        @response = RestClient::Request.execute(:url => url, :user => user, :password => 'Welcome@1', :method => :get, :headers => headers)
      when 'PUT'
        @response = RestClient::Request.execute(:url => url, :user => user, :password => 'Welcome@1', :method => :put, :payload => payload, :headers => headers)
      else
        flunk 'Please choose correct service. Provided service ' + service + 'does not exist'
    end
  end


end
