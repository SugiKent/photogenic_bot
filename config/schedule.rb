# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

env :GEM_PATH, ENV['GEM_PATH']
set :environment, :production
require File.expand_path(File.dirname(__FILE__) + "/environment")
set :output, 'log/cron.log'
set :bundle_command, "/root/.rbenv/shims/bundle"

# Could not find command "script/runner"のエラー対処のため
job_type :custom_runner,
  "cd :path && /root/.rbenv/shims/bundle exec rails runner -e :environment ':task' :output"


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

# 9時から22時の間で2時間に一回
# 実質10時から22時。
every 2.hours, :at => ('9'..'22').to_a.collect do
  custom_runner "Post.tweet_update"
end
