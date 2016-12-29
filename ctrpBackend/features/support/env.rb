require 'rspec'
require 'json'
require 'rest-client'
require 'rspec/expectations'
require "test/unit/assertions"
include Test::Unit::Assertions


base_qa2 = 'https://trials-qa2.nci.nih.gov/'
base_local = 'https://localhost/'


po_point = 'po-webservices/services/'
org_endpoint = 'organization-rest-service/organization/'
per_endpoint = 'person-rest-service/person/'

ENV['choose_ENV'] = 'qa2'
ENV['user1'] = 'ctrpqatester1'

case ENV['choose_ENV']
  when 'qa2'
    ENV['create_organization'] = base_qa2 + po_point + org_endpoint
    ENV['update_organization'] = base_qa2 + po_point + org_endpoint
    ENV['create_person'] = base_qa2 + po_point + per_endpoint
    ENV['update_person'] = base_qa2 + po_point + per_endpoint
  when 'local'
    ENV['create_organization'] = base_local + po_point + org_endpoint
    ENV['update_organization'] = base_local + po_point + org_endpoint
    ENV['create_person'] = base_local + po_point + per_endpoint
    ENV['update_person'] = base_local + po_point + per_endpoint
  else
    puts 'Please choose correct Environment.'
end
