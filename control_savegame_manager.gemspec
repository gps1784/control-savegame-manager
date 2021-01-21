require_relative 'lib/control_savegame_manager/version'

Gem::Specification.new do |spec|
  spec.name          = "control_savegame_manager"
  spec.version       = ControlSavegameManager::VERSION
  spec.authors       = ["Grant Sparks"]
  spec.email         = ["grantpatricksparks@gmail.com"]

  spec.summary       = "Manage savegame slots for Remedy\'s 2019 title \"Control\""
  spec.description   = "Manage savegame slots for Remedy\'s 2019 title \"Control\". Includes a CLI tool (bin/control.rb)."
  spec.homepage      = "https://github.com/gps1784/control_savegame_manager"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gps1784/control_savegame_manager"
  spec.metadata["changelog_uri"] = "https://github.com/gps1784/control_savegame_manager/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
