class OutcomeMeasures


  @safety_issue_xpath = "//label[@for='safety']"
  @safety_issue_table_xpath = "//*[contains(text(),'Safety Issue')]"
  @edit_xpath = "//img[contains(@src, '/pa/images/ico_edit.gif')]"
  @outcome_measure_type_xpath = "//select[@id='webDTO.outcomeMeasure.typeCode']"
  @title_id = 'fileName'
  @time_frame_id = 'typeCode'
  @outcome_measure_type_id = "webDTO.outcomeMeasure.typeCode"

  def self.outcome_measure_type_id
    @outcome_measure_type_id
  end
  def self.time_frame_id
    @time_frame_id
  end
  def self.title_id
    @title_id
  end
  def self.outcome_measure_type_xpath
    @outcome_measure_type_xpath
  end
  def self.safety_issue_table_xpath
    @safety_issue_table_xpath
  end
  def self.safety_issue_xpath
    @safety_issue_xpath
  end
  def self.edit_xpath
    @edit_xpath
  end

end