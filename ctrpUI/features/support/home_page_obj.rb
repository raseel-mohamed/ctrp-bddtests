class HomePagePA

    @username_id = 'j_username'
    @password_id = 'j_password'

    @pologin_id = 'loginButton'
    @accept_disclaimer_id = "acceptDisclaimer"
    @reject_disclaimer_id = 'rejectDisclaimer'
    @login_link_id = 'userarea'

#PO

  @login_id = 'loginLink'
  @poaccept_disclaimer_id = 'accept_disclaimer'

  def self.username_id
    @username_id
  end

  def self.password_id
    @password_id
  end

  def self.login_id
    @login_id
  end

  def self.accept_disclaimer_id
    @accept_disclaimer_id
  end

  def self.reject_disclaimer_id
    @reject_disclaimer_id
  end

  def self.login_link_id
    @login_link_id
  end

    def self.pologin_id
      @pologin_id
    end

  def self.poaccept_disclaimer_id
    @poaccept_disclaimer_id
  end

end

