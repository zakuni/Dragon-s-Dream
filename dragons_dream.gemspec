# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dragons_dream/version'

Gem::Specification.new do |gem|
  gem.name          = "dragons_dream"
  gem.version       = DragonsDream::VERSION
  gem.authors       = ["zakuni"]
  gem.email         = ["kunio038@gmail.com"]
  gem.description   = %q{Japanese Railway Information}
  gem.summary       = %q{Japanese Railway Information}
  gem.homepage      = "https://github.com/zakuni/Dragon-s-Dream"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "nokogiri"
  gem.add_development_dependency "guard-minitest"
  gem.add_development_dependency "rb-fsevent"
  gem.add_development_dependency "growl"
  gem.add_development_dependency "minitest-reporters"
end
