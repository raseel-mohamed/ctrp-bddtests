class EligiblityCriteria

  @identifier_id = 'identifier'
  @search_class = 'search'
  @search_value_class = 'title'
  @sex_id = 'gender'
  @gender_base_true_xpath = ".//*[@id='genderNew']/option[3]"
  @gender_base_false_xpath = ".//*[@id='genderNew']/option[2]"
  @gender_desc_xpath= "//tr[@id='genderDescriptionRow']"
  @gender_base_id = "genderNew"
  @gender_label_xpath = "//label[@for='gender']"


  def self.gender_label_xpath
    @gender_label_xpath
  end

  def self.identifier_id
    @identifier_id
  end

  def self.search_class
    @search_class
  end

  def self.search_value_class
    @search_value_class
  end

  def self.sex_id
    @sex_id
  end

  def self.gender_desc_xpath
    @gender_desc_xpath
  end

  def self.gender_base_id
    @gender_base_id
  end

  def self.gender_base_true_xpath
    @gender_base_true_xpath
  end

  def self.gender_base_false_xpath
    @gender_base_false_xpath
  end
end



