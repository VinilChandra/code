class RemoveRecruiterTokenColumns < ActiveRecord::Migration
  def change
  	
  	remove_column :recruiters, :password_reset_token
    remove_column :recruiters, :password_reset_sent_at
  end
end
