# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snakes_and_ladders/version'

Gem::Specification.new do |spec|
  spec.name          = "snakes_and_ladders"
  spec.version       = SnakesAndLadders::VERSION
  spec.authors       = ["Mohamad El-Husseini"]
  spec.email         = ["husseini.mel@gmail.com"]
  spec.description   = %q{A Ruby implementation Snakes and Ladders (Chutes and Ladders) board game.}
  spec.summary       = %q{This is an object oriented Ruby implementation of the classic Snakes and Ladders (Chutes and Ladders) board game.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
