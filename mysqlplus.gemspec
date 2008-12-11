Gem::Specification.new do |s|
  s.name     = "mysqlplus"
  s.version  = "0.1.0"
  s.date     = "2008-08-13"
  s.summary  = "Enhanced Ruby MySQL driver"
  s.email    = "oldmoe@gmail.com"
  s.homepage = "http://github.com/oldmoe/mysqlplus"
  s.description = "Enhanced Ruby MySQL driver"
  s.has_rdoc = true
  s.authors  = ["Muhammad A. Ali"]
  s.platform = Gem::Platform::RUBY
  s.files    = [ 
		"mysqlplus.gemspec", 
		"README",
		"Rakefile",
		"lib/mysqlplus.rb",
		"test/test_helper.rb",
		"test/native_threaded_test.rb",
		"test/c_threaded_test.rb",
		"test/evented_test.rb",
		"ext/vio.h",
		"ext/error_const.h",
		"ext/extconf.rb",
		"ext/mysql.c"
	]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
  s.extensions << "ext/extconf.rb"
end

