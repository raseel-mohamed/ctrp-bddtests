require 'rspec'
require 'json'
require 'rest-client'

class CT_api_helper

  def self.xml_read(xml)

    # siteURL = &quot;holler.com&quot;
    # apiURL = &quot;http://api.facebook.com/restserver.php?method=links.getStats&amp;urls=#{siteURL}&quot;
    apiURL = 'https://clinicaltrials.gov/ct2/show/NCT03093480/xml'
        xml_data = Net::HTTP.get_response(URI.parse(apiURL)).body
    doc = LibXML::XML::Parser.string(xml_data).parse #parses the XML data

    # here is a hack if you can't figure out where to go from here

    content = doc.to_s #convert the XML data into a string
    res = content.match(/like_count&gt;([^&lt;]+)&lt;/)[1] #a regular expression to find the tag
    like_count = res.to_i #convert the string into an integer if necessary
    puts &quot;Like count is #{like_count}&quot;

  end

end
