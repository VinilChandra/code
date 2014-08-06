namespace :user do
  desc "Send Weekly email"
  task :weekly_mail => :environment do
  	User.mail_recap
  end
end