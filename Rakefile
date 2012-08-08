require 'open3'

task :default do
  puts "\x1b[35m******* Rails 3.0 ********\x1b[0m"
  Dir.chdir(File.expand_path("../rails-3.0", __FILE__))
  i,o,t=Open3.popen2e("zeus start")
  system "ruby TEST_APP.rb"
  Process.kill("INT", t.pid)

  puts "\x1b[35m******* Rails 3.2 ********\x1b[0m"
  Dir.chdir(File.expand_path("../rails-3.2", __FILE__))
  i,o,t=Open3.popen2e("zeus start")
  system "ruby TEST_APP.rb"
  Process.kill("INT", t.pid)
end
