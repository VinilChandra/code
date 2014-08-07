class AddrecruiterpasswordresetToRecruiter < ActiveRecord::Migration
  def change
  	add_column :recruiters, :password_recruiterreset_token, :string
    add_column :recruiters, :password_recruiterreset_sent_at, :datetime
  end
end
