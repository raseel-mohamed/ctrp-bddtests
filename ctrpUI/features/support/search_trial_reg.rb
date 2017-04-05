class SearchTrialReg

  @trial_search_text_id = 'identifier'
  @trial_search_button_id = 'runSearchBtn'
  @trial_search_my_trial = 'searchMyTrialsBtn'
  @trial_protocol_link_id = 'NCI-2013-00038'
  @trial_action_view = 'ColVis_Button ColVis_MasterButton' #'//*[@id="row"]/tbody/tr/td[10]/div/button'

  def self.trial_search_text_id
    @trial_search_text_id
  end

  def self.trial_search_button_id
    @trial_search_button_id
  end

  def self.trial_search_my_trial
    @trial_search_my_trial
  end

  def self.trial_protocol_link_id
    @trial_protocol_link_id
  end

  def self.trial_action_view
    @trial_action_view
  end

end