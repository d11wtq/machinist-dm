# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "machinist/data_mapper/version"

Gem::Specification.new do |s|
  s.name        = "machinist-dm"
  s.version     = Machinist::DataMapper::VERSION
  s.authors     = ["Chris Corbyn"]
  s.email       = ["chris@w3style.co.uk"]
  s.homepage    = "https://github.com/d11wtq/machinist-dm"
  s.summary     = %q{DataMapper support for Machinist 2}
  s.description = %q{Allows Machinist 2 to operate with DataMapper instead of ActiveRecord}

  s.rubyforge_project = "machinist-dm"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activesupport"
  s.add_dependency "i18n"
  s.add_dependency "machinist", ">= 2.0.0.beta2"

  s.add_development_dependency "dm-core", ">= 1.1.0"
  s.add_development_dependency "dm-migrations"
  s.add_development_dependency "dm-validations"
  s.add_development_dependency "dm-mysql-adapter"
  s.add_development_dependency "rspec",   "~> 2.6"
end
