# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pauls_cool_gem/version'

Gem::Specification.new do |gem|
  gem.name          = "pauls_cool_gem"
  gem.version       = PaulsCoolGem::VERSION
  gem.authors       = ["paulb896"]
  gem.email         = ["paulb896@gmail.com"]
  gem.description   = "Tracks user availability"
  gem.summary       = "Tracks user availability"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency "rspec", ">= 2.0.0"
end
