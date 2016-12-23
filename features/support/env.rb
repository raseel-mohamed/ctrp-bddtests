base_qa2 = 'https://trials-qa2.nci.nih.gov/'
base_local = 'https://localhost/'


po_point = 'po-webservices/services/'
org_endpoint = 'organization-rest-service/organization/'

ENV['choose_ENV'] = 'qa2'
ENV['user1'] = 'ctrpqatester1'

case ENV['choose_ENV']
  when 'qa2'
    ENV['create_organization'] = base_qa2 + po_point + org_endpoint
    ENV['update_organization'] = base_qa2 + po_point + org_endpoint
  when 'local'
    ENV['create_organization'] = base_local + po_point + org_endpoint
    ENV['update_organization'] = base_local + po_point + org_endpoint
  else
    puts 'Please choose correct Environment.'
end
