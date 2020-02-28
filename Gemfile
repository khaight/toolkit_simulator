source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.0.3'
gem 'rest-client', '~> 2.0.2'

group :development do
  gem 'listen', '~> 3.1.5'
  gem 'rubocop', '~> 0.48.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
