<<<<<<< Updated upstream
# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: mobilize-america-client 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "mobilize-america-client".freeze
  s.version = "0.5.1"
=======
# frozen_string_literal: true
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mobilize_america_client/version'

Gem::Specification.new do |s|
  s.name = "mobilize-america-client".freeze
  s.version = MobilizeAmericaClient::VERSION
>>>>>>> Stashed changes

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Grey Moore".freeze]
  s.date = "2023-03-02"
  s.email = "grey@controlshiftlabs.com".freeze
  s.executables = ["console".freeze, "setup".freeze]
<<<<<<< Updated upstream
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
    "lib/mobilize_america_client/client/attendances.rb",
    "lib/mobilize_america_client/client/enums.rb",
    "lib/mobilize_america_client/client/events.rb",
    "lib/mobilize_america_client/client/organizations.rb",
    "lib/mobilize_america_client/errors.rb",
    "lib/mobilize_america_client/request.rb",
    "mobilize-america-client.gemspec",
    "spec/client/attendances_spec.rb",
    "spec/client/client_spec.rb",
    "spec/client/enums_spec.rb",
    "spec/client/events_spec.rb",
    "spec/client/organizations_spec.rb",
    "spec/fixtures/organizations.json",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/controlshift/mobilize_america_client".freeze
=======
  s.extra_rdoc_files = %w[LICENSE README.md]
  s.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  s.homepage = "https://github.com/controlshift/mobilize_america_client".freeze
>>>>>>> Stashed changes
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

