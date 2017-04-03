class TrialINDIDE

  @add_btn_xpath = "//span[@class='add']"
  @ava_of_exp_acc_unknown_xpath = ".//*[@id='group4']/option[2]"
  @ava_of_exp_acc_no_xpath = ".//*[@id='group4']/option[3]"
  @ava_of_exp_acc_yes_xpath = ".//*[@id='group4']/option[4]"
  @ava_of_exp_acc_xpath = "//label[@for='group4true']"
  @ava_of_ex_acc_id='group4'
  @exp_acc_rec_xpath = "//label[@for='expandedAccessNctId']"
  @ind_ide_type_id = "group3IDE"
  @number_id = 'indidenumber'
  @grantor_id = 'SubCat'
  @holder_type_id = 'holderType'


  def self.holder_type_id
    @holder_type_id
  end
  def self.grantor_id
    @grantor_id
  end
  def self.ava_of_ex_acc_id
    @ava_of_ex_acc_id
  end
  def self.number_id
    @number_id
  end
  def self.ind_ide_type_id
    @ind_ide_type_id
  end
  def self.add_btn_xpath
    @add_btn_xpath
  end
  def self.ava_of_exp_acc_unknown_xpath
    @ava_of_exp_acc_unknown_xpath

  end
  def self.ava_of_exp_acc_no_xpath
    @ava_of_exp_acc_no_xpath

  end
  def self.ava_of_exp_acc_yes_xpath
    @ava_of_exp_acc_yes_xpath

  end
  def self.ava_of_exp_acc_xpath
    @ava_of_exp_acc_xpath
  end
  def self.exp_acc_rec_xpath
    @exp_acc_rec_xpath
  end
end