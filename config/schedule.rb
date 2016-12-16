set :output, {:error => 'log/whenever_error.log', :standard => 'log/whenever_standard.log'}
set :task_log_head, %Q{schedule job }

job_type :ruby,  "cd :path && bundle exec ruby :task :output"
job_type :task_logger,  %{cd :path && bundle exec ruby -e 'puts  Time.now.to_s + " :task_log_head **:task**"' :output}

# 每天执行
# every :day, :at => '10:45am', :roles => [:whenever] do
#   task_logger %{demo Start}
#   rake 'demo'
#   task_logger %{demo FINISHED}
# end