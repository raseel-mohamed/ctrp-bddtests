class RegulatoryInformation
  @drug_approval_dropdown_id = 'approval'
  @unapproved_uncleared_device_id = 'delpostindid'
  @delayed_posting_indicator_id = 'delpostindid'


  def self.drug_approval_dropdown_id
    @drug_approval_dropdown_id
  end

  def self.unapproved_uncleared_device_id
    @unapproved_uncleared_device_id
  end

  def self.delayed_posting_indicator_id
    @delayed_posting_indicator_id
  end

end