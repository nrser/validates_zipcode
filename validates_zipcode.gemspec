# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validates_zipcode/version'

# Don't trigger off `.git` *files* - they mean submodule, and there may
# not be a `.git` where it points (containers where this whole dir has
# been lazily mounted but the parent has been per-path mounted to exclude
# the `.git`)
is_git_repo = File.directory? File.join(File.dirname(__FILE__), '.git')

Gem::Specification.new do |s|
  s.name          = "validates_zipcode"
  s.version       = ValidatesZipcode::VERSION
  s.authors       = ["David Gil"]
  s.email         = ["dgilperez@gmail.com"]
  s.summary       = %q{Localizable zipcode validation for Rails.}
  s.description   = %q{Adds zipcode validation methods to ActiveModel considering different country zipcode formats.}
  s.homepage      = "http://github.com/dgilperez/validates_zipcode"
  s.license       = "MIT"

  s.files         = if is_git_repo
    `git ls-files -z`.split("\x0")
  else
    []
  end
  
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'activemodel', '>= 3.2.0'

  s.add_development_dependency "bundler", "~> 1.6"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "appraisal"
end
