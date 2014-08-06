class Recruiter < ActiveRecord::Base

has_secure_password
 before_create :create_remember_token

 def Recruiter.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Recruiter.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

def self.mail_recap
    @recruiter = Recruiter.all
    @recruiter.each do |u|
      UserMailer.mail_recap(u.email).deliver
    end
  end

  private

    def create_remember_token
      self.remember_token = Recruiter.digest(Recruiter.new_remember_token)
    end

end
