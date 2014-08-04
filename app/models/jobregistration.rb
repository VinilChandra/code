class Jobregistration < ActiveRecord::Base
       validates :name,presence: true
       validates :age, presence: true,numericality: { greater_than_or_equal_to: 18, allow_nil: true }
       validates :housenumber,presence: true
       validates :street,presence: true
       validates :village,presence: true
       validates :district,presence: true
       validates :state,presence: true
       validates :phone,presence: true ,numericality: { greater_than_or_equal_to: 10 }
       VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
       validates :email, presence: true,
                     format:{ with: VALID_EMAIL_REGEX }
       validates :experience,presence: true ,numericality: { greater_than_or_equal_to: 0, allow_nil: true }
       validates :qualification,presence: true
       validates :attachment,presence: true

end
