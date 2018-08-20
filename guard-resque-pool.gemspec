# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard/resque-pool/version"

Gem::Specification.new do |s|
  s.name        = 'guard-resque-pool'
  s.version     = '1.0.0'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Yavor Stoychev']
  s.email       = ['stoychev.yavor@gmail.com']
  s.homepage    = 'http://github.com/railsjedi/guard-resque'
  s.summary     = %q{guard gem for resque-pool}
  s.description = %q{Guard::Resque automatically starts/stops/restarts resque-pool}

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project = "guard-resque"

  s.add_dependency 'guard', '~> 2.0'
  s.add_dependency 'resque-pool', '~> 0.6'
  s.add_dependency 'guard-compat', '~> 1.1'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake', '>0.8.7'
  s.add_development_dependency 'rspec',         '~> 2.5'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
