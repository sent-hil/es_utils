# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'es_utils/version'

Gem::Specification.new do |spec|
  spec.name          = "es_utils"
  spec.version       = EsUtils::VERSION
  spec.authors       = ["sent-hil"]
  spec.email         = ["me@sent-hil.com"]
  spec.description   = %q{Utils library for elasticsearch gem}
  spec.summary       = %q{This library contains a bunch of improvements and additions to elasticsearch ruby gem.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
end
