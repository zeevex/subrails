# -*- encoding: utf-8 -*-
require File.expand_path('../lib/subrails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jared Grippe"]
  gem.email         = ["jared@change.org"]
  gem.description   = %q{Better subdomain support for Rails.}
  gem.summary       = %q{Better subdomain support for Rails.}
  gem.homepage      = "https://github.com/change/subrails"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "subrails"
  gem.require_paths = ["lib"]
  gem.version       = Subrails::VERSION

  gem.add_runtime_dependency "rails", "~> 3.0.0"
  gem.add_runtime_dependency "uri-subdomain"

  gem.add_development_dependency "rake"
end
