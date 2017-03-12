source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rack', '~> 1.6.0'
gem 'grape', '~> 0.17.0'
gem 'grape-entity', '~> 0.5.1'
gem 'activerecord', '~> 4.2.7', require: 'active_record'
gem 'otr-activerecord', '~> 1.1.0'
gem 'sqlite3'
gem 'rake'

group :development do
  gem 'shotgun'
end

group :test do
  gem 'rack-test', require: 'rack/test'
  gem 'database_cleaner'
end
