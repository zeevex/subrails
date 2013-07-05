# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "subrails/version"

Gem::Specification.new do |s|
  s.name        = "subrails"
  s.version     = Subrails::VERSION
  s.authors     = ["Jared Grippe"]
  s.email       = ["jared@change.org"]
  s.homepage    = "http://github.com/change/subrails"
  s.summary     = %q{Adding better subdomain support to rails}
  s.description = %q{Adding better subdomain support to rails}

  s.rubyforge_project = "subrails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_runtime_dependency "rails",         ">= 3, < 4"
  s.add_runtime_dependency "uri-subdomain"
end
