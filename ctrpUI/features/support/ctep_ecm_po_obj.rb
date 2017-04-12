class CTEPECMPO

@ctep_org_id = 'searchOrganizationForm_criteria_ctepID'
@search_btn = 'submitSearchOrganizationForm'
@po_org_curate_btn = 'org_id_5005'

  @ctep_person_id = 'searchPersonForm_criteria_ctepID'
  @search_person_xpath = "//span[@class='search']"
  @person_curate_id = 'person_id_5005'
  @person_firstname_id ='curateEntityForm_person_firstName'

  def self.person_firstname_id
    @person_firstname_id
  end

  def self.person_curate_id
    @person_curate_id
  end

  def self.search_person_xpath
    @search_person_xpath
  end

  def self.ctep_person_id
    @ctep_person_id
  end

  def self.ctep_org_id
  @ctep_org_id
  end

  def self.ctep_txt_id
    @ctep_txt_id
  end

  def self.search_btn
  @search_btn
  end

  def self.po_org_curate_btn
  @po_org_curate_btn
  end

end