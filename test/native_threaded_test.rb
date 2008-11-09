require File.dirname(__FILE__) + '/test_helper'
require 'yaml'
# attempt to load a test/database.yml with the following fields
#
# :username: name
# :password: pass
# :host: host_ip
# :port: host_port
# :sock: unix_sock
#
# If the yml file doesn't exist root localhost will be used by default
def mysql_connect
  if !defined?($mysql_config)
    config_file=File.join(File.dirname(__FILE__),'database.yml')
    if File.exist?(config_file)
      $mysql_config = YAML.load_file(config_file)
    else
      $mysql_config = {:username => 'root', :host => 'localhost'}
      STDERR.puts "Warning using root, localhost to connect. Define a test/database.yml to override these defaults"
    end
  end
  puts $mysql_config.inspect
  dbconf = $mysql_config
  Mysql.real_connect(dbconf[:host],dbconf[:username],dbconf[:password],nil,dbconf[:port],dbconf[:sock])
end

ThreadedMysqlTest.new( 10, "Threaded, native Ruby, very small overhead"  ) do |test|
  test.setup{ mysql_connect }
  test.per_query_overhead = 0.005
  test.query_with = :async_query   
  test.run!
end

ThreadedMysqlTest.new( 10, "Threaded, native Ruby, small overhead"  ) do |test|
  test.setup{ mysql_connect }
  test.per_query_overhead = 0.1
  test.query_with = :async_query     
  test.run!
end

ThreadedMysqlTest.new( 10, "Threaded, native Ruby, medium overhead"  ) do |test|
  test.setup{ mysql_connect }
  test.per_query_overhead = 1
  test.query_with = :async_query     
  test.run!
end

ThreadedMysqlTest.new( 10, "Threaded, native Ruby, large overhead"  ) do |test|
  test.setup{ mysql_connect }
  test.per_query_overhead = 3
  test.query_with = :async_query     
  test.run!
end

ThreadedMysqlTest.new( 10, "Threaded, native Ruby, random overhead"  ) do |test|
  test.setup{ mysql_connect }
  test.per_query_overhead = :random
  test.query_with = :async_query     
  test.run!
end
