
class Home_page

  def initialize
    @address = @browser.element(class: "address")
    @phone = @browser.element(class: "phone")
    @email = @browser.element(class: "email")
  end

  def address
    @address
  end

  def phone
    @address
  end

  def email
    @email
  end

end