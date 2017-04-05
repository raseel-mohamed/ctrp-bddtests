class EligiblityCriteria

  @search_value_class = 'title'
  @sex_id = 'gender'
  @gender_base_true_xpath = ".//*[@id='genderNew']/option[3]"
  @gender_base_false_xpath = ".//*[@id='genderNew']/option[2]"
  @gender_desc_xpath= "//tr[@id='genderDescriptionRow']"
  @gender_base_id = "genderNew"
  @gender_label_xpath = "//label[@for='gender']"
  @acc_health_vol_id = "acceptHealthy"
  @sex_all_id = "gender"
  @min_age_id = "minage"
  @max_age_id = "maxage"
  @min_age_unit_id = "minageunit"
  @max_age_unit_id = "maxageunit"


  def self.min_age_unit_id
    @min_age_unit_id
  end

  def self.max_age_unit_id
    @max_age_unit_id
  end

  def self.min_age_id
    @min_age_id
  end

  def self.max_age_id
    @max_age_id
  end
  def self.sex_all_id
    @sex_all_id
  end

  def self.acc_health_vol_id
    @acc_health_vol_id
  end

  def self.gender_label_xpath
    @gender_label_xpath
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



