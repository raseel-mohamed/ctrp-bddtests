class EligiblityCriteria

  @identifier_id = 'identifier'
  @search_class = 'search'
  @search_value_class = 'title'
  @gender_base_false_xpath = ".//*[@id='genderNew']/option[2]"
  @gender_base_true_xpath = ".//*[@id='genderNew']/option[3]"
  @gender_id = "gender"
  @gender_desc_xpath= "//tr[@id='genderDescriptionRow']"
  @gender_base_id = "genderNew"


  def self.identifier_id
    @identifier_id
  end

  def self.search_class
    @search_class
  end

  def self.search_value_class
    @search_value_class
  end

  def self.gender_base_false_xpath
    @gender_base_false_xpath
  end

  def self.gender_base_true_xpath
    @gender_base_true_xpath
  end

  def self.gender_id
    @gender_id
  end

  def self.gender_desc_xpath
    @gender_desc_xpath
  end

  def self.gender_base_id
    @gender_base_id
  end
end



