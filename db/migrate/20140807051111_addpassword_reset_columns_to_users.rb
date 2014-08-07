class AddpasswordResetColumnsToUsers < ActiveRecord::Migration
  def change
  		add_column :recruiters, :password_reset_token, :string
    add_column :recruiters, :password_reset_sent_at, :datetime
  end
end
