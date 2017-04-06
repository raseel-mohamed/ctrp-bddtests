a = "Message. Trial NCT03093480 has been imported and registered in CTRP system successfully. A unique NCI identifier NCI-2017-00383 has been assigned to this trial with a processing status of Submitted. "
@NCT_ID = 'NCT03093480'
#first = a.split("#{@NCT_ID}").last.split('has been assigned to')#.first.gsub!("and","").gsub!(" ","")
#p first
first = a.split('A unique NCI identifier').last.split('has been assigned to').first.strip
p first

=begin
b = first.last.split('has been made successfully.')
p b

c = b[0].gsub!("and","").gsub!(" ","")
p c
=end