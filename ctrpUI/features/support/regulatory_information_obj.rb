class RegulatoryInformation
  @drug_approval_dropdown_id = 'approval'
  @unapproved_uncleared_device_id = 'delpostindid'

  def self.drug_approval_dropdown_id
    @drug_approval_dropdown_id
  end

  def self.unapproved_uncleared_device_id
    @unapproved_uncleared_device_id
  end

end