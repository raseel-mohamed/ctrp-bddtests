
$dunit ||= false

# Before do
#   headers = {:content_type => 'application/xml', :accept => 'application/xml'}
#
#  # $dunit ||= false  # have to define a variable before we can reference its value
#   puts '1st'
#   puts $dunit
#   if $dunit == false                 # bail if $dunit TRUE
#   puts 'I am here'
#     Import_helper.trigger_import_post('POST', 'import', ENV['user1'], ENV['user1_password'], headers, 'NCT03093480')
#    #step "run the really slow log in method" # otherwise do it.
#     puts 'This is the response : ' + @response.to_s
#     puts 'This is the response code: ' + @response_code.to_s
#     puts 'This is the response body: ' + @response_body.to_s
#
#
#    $dunit = true                            # don't do it again.
#   puts '2nd'
#   puts $dunit
#   expect(@response_code.to_s).to eq '200'
#     end
# end


Given(/^I want to Import a trial with NCT ID NCT(\d+)$/) do |arg1|
  headers = {:content_type => 'application/xml', :accept => 'application/xml'}
  url = 'https://clinicaltrials.gov/ct2/show/NCT'+arg1+'/xml'
  service_url = ENV['import']+'NCT'+arg1
  puts service_url
 # @response =  Helper.request('get', url, '', '', nil, {})
#  @response_json = Hash.from_xml(@response).to_json
 #  puts @response_json
#  @conn = PGconn.connect(:host=>ENV['db_hostname'], :port=>ENV['db_port'], :dbname=>ENV['db_name'], :user=>ENV['db_user'],:password=>ENV['db_pass'])
 # @res = @conn.exec("SELECT name FROM organization where identifier = 234403151") #234403151
 # @res.getvalue(0,0)
 # puts @res.getvalue(0,0)
 # @response, @response_code, @response_body = Import_helper.trigger_import_post('POST', 'import', ENV['user1'], ENV['user1_password'], headers, 'NCT'+arg1)
  #@response = Import_helper.trigger_import_post('POST', 'import', ENV['user1'], ENV['user1_password'], headers, 'NCT'+arg1)
  # begin
  #   @response = RestClient::Request.execute(:url => service_url, :user => ENV['user1'], :password => ENV['user1_password'], :method => 'post', :payload => '', :headers => headers)
  # rescue StandardError => e
  #   @response = e.response
  # end

  # $dunit ||= false  # have to define a variable before we can reference its value
  # return $dunit if $dunit                  # bail if $dunit TRUE
  # headers = {:content_type => 'application/xml', :accept => 'application/xml'}
  # @response, @response_code, @response_body = Import_helper.trigger_import_post('POST', 'import', ENV['user1'], ENV['user1_password'], headers, 'NCT03093480') #step "run the really slow log in method" # otherwise do it.
  # $dunit = true

   # puts 'This is the response : ' + @response.to_s
   # puts 'This is the response code: ' + @response_code.to_s
   # puts 'This is the response body: ' + @response_body.to_s
   # expect(@response_code.to_s).to eq '200'
  # @response_body_json = Hash.from_xml(@response).to_json
  # puts @response_body_json
#  puts @response_body_json.row_hash['paTrialID']
#  puts @response_body_json.row_hash['nciTrialID']
  puts '1st'
  puts $dunit
  if $dunit == false                 # bail if $dunit TRUE
    puts 'I am here'
    @response, @response_code, @response_body = Import_helper.trigger_import_post('POST', 'import', ENV['user1'], ENV['user1_password'], headers, 'NCT03093480')
    #step "run the really slow log in method" # otherwise do it.
    puts 'This is the response : ' + @response.to_s
    puts 'This is the response code: ' + @response_code.to_s
    puts 'This is the response body: ' + @response_body.to_s
    $dunit = true                            # don't do it again.
    puts '2nd'
    puts $dunit
    expect(@response_code.to_s).to eq '200'
  #  doc = Nokogiri::XML(response.body)

     @response_body_json = Hash.from_xml(@response).to_json
     puts @response_body_json
      @trial_id = @response_body_json['TrialRegistrationConfirmation']['paTrialID']
      @nci_trial_id = @response_body_json['TrialRegistrationConfirmation']['nciTrialID']
      puts ''+@trial_id.to_s+@nci_trial_id.to_s
  end
end

Then(/^I want to verify the Lead Org Trial ID$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end
