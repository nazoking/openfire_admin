# -*- encoding: utf-8 -*-
require File.expand_path('../lib/openfire_admin/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["nazoking"]
  gem.email         = ["nazoking@gmai.com"]
  gem.description   = %q{Manipurate Openfire admin console}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "openfire_admin"
  gem.require_paths = ["lib"]
  gem.version       = OpenfireAdmin::VERSION
end
