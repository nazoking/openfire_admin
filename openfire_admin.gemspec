# -*- encoding: utf-8 -*-
require File.expand_path('../lib/openfire_admin/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["nazoking"]
  gem.email         = ["nazoking@gmai.com"]
  gem.description   = %q{Control for Openfire admin console}
  gem.summary       = %q{Control for Openfire admin console}
  gem.homepage      = "https://github.com/nazoking/openfire_admin"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "openfire_admin"
  gem.require_paths = ["lib"]
  gem.version       = OpenfireAdmin::VERSION

  gem.add_dependency "rehtml"

  gem.add_development_dependency "rspec", "= 2.14.1"
  gem.add_development_dependency "fakeweb"
end
