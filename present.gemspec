# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'present/version'

Gem::Specification.new do |spec|
  spec.name          = "present"
  spec.version       = Present::VERSION
  spec.authors       = ["Kristian Freeman"]
  spec.email         = ["kristian@kristianfreeman.com"]
  spec.description   = %q{Keynote for your command-line.}
  spec.summary       = %q{A presentation tool for the command-line. Syntax highlighting and Markdown support included!}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir['LICENSE.md', 'README.md', 'lib/**/*']
  spec.executables   << "present"
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rouge", "~> 1.2"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
