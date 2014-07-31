class User < ActiveRecord::Base
    has_secure_password
    before_save { self.email = email.downcase }
  before_create :create_remember_token

   validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  validates :phone, presence: true,numericality: { greater_than_or_equal_to: 1000000000 ,:message => "Invalid  number"}

  validates :address,presence: true
  validates :state,presence: true
  validates :dist,presence: true
  validates :citytown,presence: true
 
validates_each :birth do |record, attr, value|
  begin
    Date.parse(value)
  rescue
    record.errors.add(attr, "Invalid date")
  end
end
 
    def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
before_create { generate_token(:remember_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
