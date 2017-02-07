require 'rspec'
require 'json'
require 'rest-client'
require 'rspec/expectations'
require 'test/unit/assertions'
include Test::Unit::Assertions


base_qa2 = 'https://trials-qa2.nci.nih.gov/'
base_local = 'https://localhost/'
base_aws = 'http://ctrp-external-alb-1048354744.us-east-1.elb.amazonaws.com:39080/'


po_point = 'po-webservices/services/'
org_endpoint = 'organization-rest-service/organization/'
per_endpoint = 'person-rest-service/person/'
fam_endpoint = 'family-rest-service/'

ENV['choose_ENV'] = 'aws'
ENV['user1'] = 'curator'
ENV['user1_password'] = 'pass'

case ENV['choose_ENV']
  when 'qa2'
    ENV['create_organization'] = base_qa2 + po_point + org_endpoint
    ENV['update_organization'] = base_qa2 + po_point + org_endpoint
    ENV['create_person'] = base_qa2 + po_point + per_endpoint
    ENV['update_person'] = base_qa2 + po_point + per_endpoint
    ENV['search_family'] = base_qa2 + po_point + fam_endpoint
  when 'local'
    ENV['create_organization'] = base_local + po_point + org_endpoint
    ENV['update_organization'] = base_local + po_point + org_endpoint
    ENV['create_person'] = base_local + po_point + per_endpoint
    ENV['update_person'] = base_local + po_point + per_endpoint
    ENV['search_family'] = base_local + po_point + fam_endpoint
  when 'aws'
    ENV['create_organization'] = base_aws + po_point + org_endpoint
    ENV['update_organization'] = base_aws + po_point + org_endpoint
    ENV['create_person'] = base_aws + po_point + per_endpoint
    ENV['update_person'] = base_aws + po_point + per_endpoint
    ENV['search_family'] = base_aws + po_point + fam_endpoint
  else
    puts 'Please choose correct Environment.'
end
