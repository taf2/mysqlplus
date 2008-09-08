require File.dirname(__FILE__) + '/test_helper'

ThreadedMysqlTest.new( 10, "Threaded, native Ruby, small overhead"  ) do |test|
  test.setup{ Mysql.real_connect('localhost','root') }
  test.per_query_overhead = 0.1
  test.run!
end

ThreadedMysqlTest.new( 10, "Threaded, native Ruby, medium overhead"  ) do |test|
  test.setup{ Mysql.real_connect('localhost','root') }
  test.per_query_overhead = 1
  test.run!
end

ThreadedMysqlTest.new( 10, "Threaded, native Ruby, large overhead"  ) do |test|
  test.setup{ Mysql.real_connect('localhost','root') }
  test.per_query_overhead = 3
  test.run!
end

ThreadedMysqlTest.new( 10, "Threaded, native Ruby, random overhead"  ) do |test|
  test.setup{ Mysql.real_connect('localhost','root') }
  test.per_query_overhead = :random
  test.run!
end

ThreadedMysqlTest.new( 10, "Threaded, C, small overhead"  ) do |test|
  test.setup{ Mysql.real_connect('localhost','root') }
  test.per_query_overhead = 0.1
  test.c_async_query = true
  test.run!
end

ThreadedMysqlTest.new( 10, "Threaded, C, medium overhead"  ) do |test|
  test.setup{ Mysql.real_connect('localhost','root') }
  test.per_query_overhead = 1
  test.c_async_query = true
  test.run!
end

ThreadedMysqlTest.new( 10, "Threaded, C, large overhead"  ) do |test|
  test.setup{ Mysql.real_connect('localhost','root') }
  test.per_query_overhead = 3
  test.c_async_query = true
  test.run!
end

ThreadedMysqlTest.new( 10, "Threaded, C, random overhead"  ) do |test|
  test.setup{ Mysql.real_connect('localhost','root') }
  test.per_query_overhead = :random
  test.c_async_query = true
  test.run!
end