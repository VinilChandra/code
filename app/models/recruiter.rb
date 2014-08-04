class Recruiter < ActiveRecord::Base

has_secure_password

 def Recruiter.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Recruiter.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
before_create { generate_token(:remember_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    RecruiterMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Recruiter.exists?(column => self[column])
  end
  private

    def create_remember_token
      self.remember_token = Recruiter.digest(Recruiter.new_remember_token)
    end

end
