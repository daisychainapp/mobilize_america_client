source "https://rubygems.org"

# Matches the gemspec constraint. The old '~> 2.0.0' pin resolved to faraday
# 2.0.1, which can't load on Ruby 4 (logger is no longer a default gem) and is
# nowhere near the 2.x our consumers actually run.
gem 'faraday', '~> 2'
gem 'bigdecimal'
gem 'base64'

group :development do
  gem 'rspec'
  gem 'rake'
  gem 'webmock'
  gem 'rubocop'
  gem 'dotenv'
  gem 'debug'
end
