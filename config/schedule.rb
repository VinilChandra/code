# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
job_type :runner, "source $HOME/.rvm/scripts/rvm && rvm use ruby-2.1.2 && cd :path && rails runner -e :environment ':task' :output"

every 4.hours do
   runner 'Recruiter.mail_recap', :environment => 'development',:output=>'log/cron.log'
end