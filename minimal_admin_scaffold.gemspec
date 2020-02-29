
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mini_admin/version"

Gem::Specification.new do |spec|
  spec.name          = "mini_admin"
  spec.version       = MiniAdmin::VERSION
  spec.authors       = ["Junya Ishihara"]
  spec.email         = ["webmaster@champierre.com"]

  spec.summary       = %q{Minimal Rails admin scaffolding generator}
  spec.description   = %q{Rails admin scaffolding generator for minimalists. This generates controllers, views files for admin pages as few as possible.}
  spec.homepage      = "https://github.com/champierre/mini_admin"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
