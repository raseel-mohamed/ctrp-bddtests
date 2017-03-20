class DesignDetails

  @study_type_id = 'study'
  @study_model_id = 'conf'
  @masking_desc_xpath = '//label[@for="maskingDesc"]'
  @model_desc_xpath = '//label[@for="modelDesc"]'
  @label_study_model_xpath = '//label[@for="conf"]'
  @interventional_study_model_required_label_xpath = "//label[contains(text(),'Interventional Study Model')]/span[@class='required']"
  @interventional_study_model_id = 'conf'
  @primary_purpose_id = 'webDTO.primaryPurposeCode'
  @participant_xpath = "//label[@for='subject']"
  @careprovider_xpath = "//label[@for='caregiver']"
  @masking_xpath = ".//label[@for='masking']"
  @study_classification_xpath = ".//label[@for='classification']"

  def self.study_classification_xpath
    @study_classification_xpath
  end

  def self.masking_xpath
    @masking_xpath
  end

  def self.careprovider_xpath
    @careprovider_xpath
  end

  def self.participant_xpath
    @participant_xpath
  end

  def self.primary_purpose_id
    @primary_purpose_id
  end

  def self.study_type_id
    @study_type_id
  end

  def self.study_model_id
    @study_model_id
  end

  def self.masking_desc_xpath
    @masking_desc_xpath
  end

  def self.model_desc_xpath
    @model_desc_xpath
  end

  def self.label_study_model_xpath
    @label_study_model_xpath
  end

  def self.interventional_study_model_required_label_xpath
    @interventional_study_model_required_label_xpath
  end

  def self.interventional_study_model_id
    @interventional_study_model_id
  end

end