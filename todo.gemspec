# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'todo/version'

Gem::Specification.new do |spec|
  spec.name          = "todoooooo"
  spec.version       = Todo::VERSION
  spec.authors       = ["sugimoto"]
  spec.email         = ["sugimoto@miraie-group.jp"]

  spec.summary       = %q{TDO: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{TDO: Write a longer description or delete this line.}
  spec.homepage      = "TDO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TDO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
#  spec.files         = Dir.glob("**/*").select{|path| !(path =~ /^doc|^pkg/)}
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "yard", "~> 0.8"
  spec.add_development_dependency "redcarpet"
  spec.add_dependency "activerecord", "~> 3.2.0"
  spec.add_dependency "sqlite3", "~> 1.3.0"
end
