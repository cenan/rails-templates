generate(:controller, "site")
route "root to: 'site#index'"

run "mv README.rdoc README.md"

gem 'kaminari'
gem_group :test do
  gem "shoulda"
end

gem_group :development do
  gem "quiet_assets"
end

