class Recruiter < ActiveRecord::Base

has_secure_password
 before_create :create_remember_token

 validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  validates :phone, presence: true,numericality: { greater_than_or_equal_to: 1000000000 ,:message => "Invalid  number"}


  validates :companyname,presence: true
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
