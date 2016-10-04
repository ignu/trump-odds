# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trump_odds/version'

Gem::Specification.new do |spec|
  spec.name          = "trump_odds"
  spec.version       = TrumpOdds::VERSION
  spec.authors       = ["Len Smith"]
  spec.email         = ["len@barrison.com"]

  spec.summary       = "Get notified of any changes in fivethirtyeight from OSX"
  spec.description   = %q{
    Tired of refreshing fivethirtyeight.com to see the fate of our country?
    Don't wear out Chrome's refresh button.
    fivethirtyeight.com will be polled every minute, and you'll be alerted if there are any changes.
  }
  spec.homepage      = "https://github.com/ignu/trump-odds"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
