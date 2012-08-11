require 'open3'

root = File.dirname(File.expand_path(__FILE__))

def announce(text)
  "\x1b[35m******* #{text} ********\x1b[0m"
end

task :default do
  at_exit do
    `ps aux | grep zeus | grep -v '/Applications/' | awk '{print $2}' | xargs kill -9`
  end

  puts announce("Rails 3.0")
  Dir.chdir "#{root}/rails-3.0" do
    run_tests
  end

  puts announce("Rails 3.2")
  Dir.chdir "#{root}/rails-3.2" do
    run_tests
  end
end

def run_tests
  i,o,t = Open3.popen2e("zeus start")
  system "(bundle check || bundle) && ruby ../TEST_APP.rb"
  Process.kill("INT", t.pid)
end
