Gem::Specification.new do |s|
  s.name = "group_cache_key"
  s.version = "0.4.1"
  s.platform = Gem::Platform::RUBY
  s.authors = ["Jim Gay", "Clemens Gruber", "Patrick Schmitz"]
  s.email   = "jim@saturnflyer.com"
  s.summary = "Adds cache_key to collections"
  s.homepage = "http://github.com/saturnflyer/group_cache_key"

  s.add_dependency "activerecord"
  s.add_dependency "activesupport"

  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"

  s.files = Dir["#{File.dirname(__FILE__)}/**/*"]
end
