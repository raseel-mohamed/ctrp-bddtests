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
  @drug_id_xpath = ".//*[@id='drug']"
  @device_id_xpath = ".//*[@id='device']"
  @unapproved_device_xpath = ".//*[@id='delpostindid']"
  @post_prior_to_us_fda_xpath = ".//*[@id='approval']"
  @pediatric_postmarket_xpath = ".//*[@id='surveillance']"
  @product_exported_xpath = ".//*[@id='export']"
  @fda_regulated_intervention_xpath = ".//*[@id='fdaindid']"
  @section_801_xpath = ".//*[@id='sec801id']"
  @data_monitoring_xpath = ".//*[@id='datamonid']"

  #xpath for the new fields in Regulatory Information screen.

  @drug_id_xpath_yes = "//*[@id='drug']/option[3]"
  @drug_id_xpath_no = "//*[@id='drug']/option[2]"
  @device_id_xpath_no = "//*[@id='device']/option[2]"
  @device_id_xpath_yes = "//*[@id='device']/option[3]"
  @post_prior_xpath_no = "//*[@id='approval']/option[2]"
  @post_prior_xpath_yes = "//*[@id='approval']/option[3]"
  @pediatric_xpath_no = "//*[@id='surveillance']/option[2]"
  @pediatric_xpath_yes = "//*[@id='surveillance']/option[3]"

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

  def self.drug_id_xpath
    @drug_id_xpath
  end

  def self.device_id_xpath
    @device_id_xpath
  end

  def self.unapproved_device_xpath
    @unapproved_device_xpath
  end

  def self.post_prior_to_us_fda_xpath
    @post_prior_to_us_fda_xpath
  end

  def self.pediatric_postmarket_xpath
    @pediatric_postmarket_xpath
  end

  def self.product_exported_xpath
    @product_exported_xpath
  end

  def self.fda_regulated_intervention_xpath
    @fda_regulated_intervention_xpath
  end

  def self.section_801_xpath
    @section_801_xpath
  end

  def self.data_monitoring_xpath
    @data_monitoring_xpath
  end

  def self.drug_id_xpath_yes
    @drug_id_xpath_yes
  end

  def self.drug_id_xpath_no
    @drug_id_xpath_no
  end

  def self.device_id_xpath_no
    @device_id_xpath_no
  end

  def self.device_id_xpath_yes
    @device_id_xpath_yes
  end

  def self.post_prior_xpath_no
    @post_prior_xpath_no
  end

  def self.post_prior_xpath_yes
    @post_prior_xpath_yes
  end

  def self.pediatric_xpath_no
    @pediatric_xpath_no
  end

  def self.pediatric_xpath_yes
    @pediatric_xpath_yes
  end

end