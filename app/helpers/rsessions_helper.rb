module RsessionsHelper
 def csign_in(recruiter)

    remember_token = Recruiter.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    recruiter.update_attribute(:remember_token, Recruiter.digest(remember_token))
    self.current_recruiter = recruiter

  end

  def csign_out
    current_recruiter.update_attribute(:remember_token,
                                  Recruiter.digest(Recruiter.new_remember_token))
    cookies.delete(:remember_token)
    self.current_recruiter = nil
  end

  def csigned_in?
    !current_recruiter.nil?
  end

  def current_recruiter=(recruiter)
    @current_recruiter = recruiter

  end

  def current_recruiter
    # @current_recruiter     # Useless! Don't use this line.
  end

  def current_recruiter

    remember_token = Recruiter.digest(cookies[:remember_token])
    @current_recruiter ||= Recruiter.find_by(remember_token: remember_token)
  end
end
