# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quicklog/version'

Gem::Specification.new do |spec|
  spec.name          = "quicklog"
  spec.version       = Quicklog::VERSION
  spec.authors       = ["Florent Guilleux"]
  spec.email         = ["florent2@gmail.com"]
  spec.description   = %q{easy logging of a variable value with its label}
  spec.summary       = %q{easy logging of a variable value with its label}
  spec.homepage      = "http://github.com/Florent2/quicklog"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.4"
  spec.add_development_dependency "rake"
end
