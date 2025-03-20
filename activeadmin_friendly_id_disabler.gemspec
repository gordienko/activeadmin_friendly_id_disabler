# frozen_string_literal: true

require_relative 'lib/activeadmin_friendly_id_disabler/version'

Gem::Specification.new do |spec|
  spec.name          = 'activeadmin_friendly_id_disabler'
  spec.version       = '0.1.0'
  spec.authors       = ['Alexey Gordienko']
  spec.email         = ['alx@anadyr.org']

  spec.summary       = "Disables FriendlyId in ActiveAdmin environments where it''s not needed."
  spec.description   = "This gem helps disable FriendlyId''s default behavior in ActiveAdmin to allow usage of standard
                        ID instead of friendly slugs in URLs, eliminating possible conflicts."
  spec.homepage      = 'https://github.com/gordienko/activeadmin_friendly_id_disabler'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org' # Default RubyGems host

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/gordienko/activeadmin_friendly_id_disabler'
  spec.metadata['changelog_uri'] = 'https://github.com/gordienko/activeadmin_friendly_id_disabler/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").grep(/^(lib|exe|LICENSE|README|CHANGELOG)/)
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Dependencies for the gem
  spec.add_dependency 'activeadmin', '>= 1.0.0'
  spec.add_dependency 'activesupport', '>= 5.0.0'
  spec.add_dependency 'friendly_id', '>= 5.3.0'
  spec.add_dependency 'rails', '>= 5.0.0'

  # Uncomment and modify the line below to test your code with dependencies that are still in development
  # spec.add_development_dependency "rspec", "~> 3.10"
  spec.metadata['rubygems_mfa_required'] = 'false'
end
