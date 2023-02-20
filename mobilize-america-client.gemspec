# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: mobilize-america-client 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mobilize-america-client".freeze
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Grey Moore".freeze]
  s.date = "2023-02-20"
  s.email = "grey@controlshiftlabs.com".freeze
  s.executables = ["console".freeze, "setup".freeze]
  s.extra_rdoc_files = [
    "LICENSE",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".github/workflows/ci.yml",
    ".rspec",
    ".rubocop.yml",
    ".ruby-gemset",
    ".ruby-version",
    "CODE_OF_CONDUCT.md",
    "Gemfile",
    "LICENSE",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/console",
    "bin/setup",
    "example.rb",
    "lib/mobilize_america_client.rb",
    "lib/mobilize_america_client/client.rb",
    "lib/mobilize_america_client/client/enums.rb",
    "lib/mobilize_america_client/client/events.rb",
    "lib/mobilize_america_client/client/organizations.rb",
    "lib/mobilize_america_client/errors.rb",
    "lib/mobilize_america_client/request.rb",
    "mobilize-america-client.gemspec",
    "spec/client/client_spec.rb",
    "spec/client/enums_spec.rb",
    "spec/client/events_spec.rb",
    "spec/client/organizations_spec.rb",
    "spec/fixtures/organizations.json",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/controlshift/mobilize_america_client".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.3".freeze
  s.summary = "Client gem for the MobilizeAmerica API".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<faraday>.freeze, ["> 0.15"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  s.add_development_dependency(%q<juwelier>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<dotenv>.freeze, [">= 0"])
  s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
end

