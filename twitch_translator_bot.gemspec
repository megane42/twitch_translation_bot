require_relative "lib/twitch_translator_bot/version"

Gem::Specification.new do |spec|
  spec.name          = "twitch_translator_bot"
  spec.version       = TwitchTranslatorBot::VERSION
  spec.authors       = ["megane42"]
  spec.email         = ["h.kzm.gm@gmail.com"]
  spec.summary       = "A twitch bot who can translate twitch chat."
  spec.description   = "A twitch bot who can translate twitch chat."
  spec.homepage      = "https://github.com/megane42/twitch_translator_bot/"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://example.com"
  spec.metadata["homepage_uri"]      = spec.homepage
  spec.metadata["source_code_uri"]   = spec.homepage
  spec.metadata["changelog_uri"]     = spec.homepage + "blob/v#{spec.version}/CHANGELOG.md"

  spec.files         = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency     "zircon", "~> 0.0.8"
  spec.add_development_dependency "dotenv", "~> 2.7.6"
end
