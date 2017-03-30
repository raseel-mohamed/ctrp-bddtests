require 'rspec'
require 'json'
require 'rest-client'
require 'rspec/expectations'
require 'test/unit/assertions'
require 'active_support/core_ext/hash'
require 'pg'
include Test::Unit::Assertions


base_qa2 = 'https://trials-qa2.nci.nih.gov/'
base_local = 'http://localhost:39480/'
base_aws = 'http://ctrp-po-inttest-elb-1603106388.us-east-1.elb.amazonaws.com:39080/'
base_aws_pa = 'http://ctrp-pa-inttest-elb-330752222.us-east-1.elb.amazonaws.com:18080/'
base_dataclinicaltrials_ms = 'http://ctrp-inttest-alb-backend-1739456098.us-east-1.elb.amazonaws.com:3100/api/v1/data_clinical_trials'
base_ctepecm_ms = 'www.google.com' # To be populated with correct ECM MS endpoint.
base_ctgov = 'https://clinicaltrials.gov/ct2/show'


#PO Endpoints
po_endpoint = 'po-webservices/services/'
reg_endpoint = 'services/trials/'
org_endpoint = 'organization-rest-service/organization/'
per_endpoint = 'person-rest-service/person/'
fam_endpoint = 'family-rest-service/'
import_endpoint = 'abbreviated/'

#ECM Endpoints
ecm_endpoint_jms = 'jmsMessage/'
ecm_endpoint_ro = 'ResearchOrganization/'
ecm_endpoint_org = 'Organization/'
ecm_endpoint_hcf = 'HealthCareFacility/'

#PA Endpoints


ENV['choose_ENV'] = 'local'
ENV['user1'] =  'ctrpqatester1'
ENV['user1_password'] = 'pass'
ENV['user2'] =  'ctrpsubstractor'
ENV['user2_password'] = 'pass'
ENV['dct_usr'] = ''
ENV['dct_pass'] = ''
ENV['ecmms_usr'] = ''
ENV['ecmms_pass'] = ''
#put ENV["USER1_ID"]
#put ENV["USER1_PASS"]

# puts 'user name: '+ENV.USER1_ID
# puts 'user pass: '+ENV.USER1_PASS

case ENV['choose_ENV']
  when 'qa2'
    ENV['create_organization'] = base_qa2 + po_endpoint + org_endpoint
    ENV['update_organization'] = base_qa2 + po_endpoint + org_endpoint
    ENV['create_person'] = base_qa2 + po_endpoint + per_endpoint
    ENV['update_person'] = base_qa2 + po_endpoint + per_endpoint
    ENV['search_family'] = base_qa2 + po_endpoint + fam_endpoint
    ENV['dataclinicaltrials_ms'] = base_dataclinicaltrials_ms
    ENV['import'] = base_qa2 + reg_endpoint + import_endpoint
    ENV['ctgov'] = base_ctgov
  when 'local'
    ENV['db_hostname'] = 'localhost'
    ENV['db_port'] = '5432'
    ENV['db_name'] = 'padb'
    ENV['db_user'] = 'postgres'
    ENV['db_pass'] = ''
    ENV['create_organization'] = base_local + po_endpoint + org_endpoint
    ENV['update_organization'] = base_local + po_endpoint + org_endpoint
    ENV['create_person'] = base_local + po_endpoint + per_endpoint
    ENV['update_person'] = base_local + po_endpoint + per_endpoint
    ENV['search_family'] = base_local + po_endpoint + fam_endpoint
    ENV['dataclinicaltrials_ms'] = base_dataclinicaltrials_ms
    ENV['import'] = base_local + reg_endpoint + import_endpoint
    ENV['ctgov'] = base_ctgov
  when 'aws'
    ENV['db_hostname'] = 'ctrp.clb9vkosemwm.us-east-1.rds.amazonaws.com'
    ENV['db_port'] = '5432'
    ENV['db_name'] = 'pa_ctrpn'
    ENV['db_user'] = 'pauser'
    ENV['db_pass'] = 'pauser'
    ENV['create_organization'] = base_aws + po_endpoint + org_endpoint
    ENV['update_organization'] = base_aws + po_endpoint + org_endpoint
    ENV['create_person'] = base_aws + po_endpoint + per_endpoint
    ENV['update_person'] = base_aws + po_endpoint + per_endpoint
    ENV['search_family'] = base_aws + po_endpoint + fam_endpoint
    ENV['dataclinicaltrials_ms'] = base_dataclinicaltrials_ms
    ENV['import'] = base_aws_pa + reg_endpoint + import_endpoint
    ENV['ctgov'] = base_ctgov
  when 'ecm'
    ENV['base_ctepecm_ms'] = base_ctepecm_ms + ecm_endpoint_ro
    ENV['base_ctepecm_ms'] = base_ctepecm_ms + ecm_endpoint_hcf
    ENV['base_ctepecm_ms'] = base_ctepecm_ms + ecm_endpoint_org
    ENV['base_ctepecm_ms'] = base_ctepecm_ms + ecm_endpoint_jms
  else
    puts 'Please choose correct Environment.'
end
