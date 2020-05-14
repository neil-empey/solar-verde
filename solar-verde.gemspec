require_relative 'lib/solar/version'

Gem::Specification.new do |spec|
  spec.name          = "solar-verde"
  spec.version       = SolarVerde::VERSION
  spec.authors       = ["Neil E"]
  spec.email         = ["argus.two.2@gmail.com\n"]

  spec.summary       = %q{Solar estimator CLI}
  spec.description   = %q{CLI project}
  spec.homepage      = "https://github.com/learn-co-git/solar-verde.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/learn-co-git/solar-verde.git"
  spec.metadata["changelog_uri"] = "https://github.com/learn-co-git/solar-verde.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
