class OutcomeMeasures


  @safety_issue_xpath = "//label[@for='safety']"
  @safety_issue_table_xpath = "//*[contains(text(),'Safety Issue')]"
  @edit_xpath = "//img[contains(@src, '/pa/images/ico_edit.gif')]"

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