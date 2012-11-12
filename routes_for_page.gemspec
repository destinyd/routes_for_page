# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'routes_for_page/version'

Gem::Specification.new do |gem|
  gem.name          = "routes_for_page"
  gem.version       = RoutesForPage::VERSION
  gem.authors       = ["destinyd"]
  gem.email         = ["destinyd.war@gmail.com"]
  gem.description   = %q{
    add routes for rails index.
  }
  gem.summary       = %q{
    add routes for rails index.
    like resources :products
    it auto build routes like /products(/page/:page) for index}
  gem.homepage      = "http://github.com/destinyd/routes_for_page"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  #gem.add_development_dependency "bundler", ">= 1.0.0"
  #gem.add_development_dependency "rspec"
end
