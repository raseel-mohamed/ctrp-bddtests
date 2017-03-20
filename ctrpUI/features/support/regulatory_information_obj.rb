class RegulatoryInformation
  @drug_approval_dropdown_id = 'approval'
  @unapproved_uncleared_device_id = 'delpostindid'
  @delayed_posting_indicator_id = 'delpostindid'
  @device_id = 'device'
  @drug_id = 'drug'
  @unapproveduncleared_device_id = 'delpostindid'
  @post_prior_to_us_fda_approval_id = 'approval'
  @pediatric_postmarket_surveillance_id = 'surveillance'
  @product_exported_fromthe_us_id = 'export'
  @fda_regulated_intervention_indicator_id = 'fdaindid'
  @section_801_indicator_id = 'sec801id'
  @data_monitoring_committee_id = 'datamonid'
  @regulatory_information_save_id = ".//*[@id='regulatoryInfoupdate']/div/del/ul/li/a[1]/span/span"



  def self.drug_approval_dropdown_id
    @drug_approval_dropdown_id
  end

  def self.unapproved_uncleared_device_id
    @unapproved_uncleared_device_id
  end

  def self.delayed_posting_indicator_id
    @delayed_posting_indicator_id
  end

  def self.drug_id
    @drug_id
  end

  def self.device_id
    @device_id
  end

  def self.unapproveduncleared_device_id
    @unapproveduncleared_device_id
  end

  def self.post_prior_to_us_fda_approval_id
    @post_prior_to_us_fda_approval_id
  end

  def self.pediatric_postmarket_surveillance_id
    @pediatric_postmarket_surveillance_id
  end

  def self.product_exported_fromthe_us_id
    @product_exported_fromthe_us_id
  end

  def self.fda_regulated_intervention_indicator_id
    @fda_regulated_intervention_indicator_id
  end

  def self.section_801_indicator_id
    @section_801_indicator_id
  end

  def self.data_monitoring_committee_id
  @data_monitoring_committee_id
  end

  def self.regulatory_information_save_id
    @regulatory_information_save_id
  end

end