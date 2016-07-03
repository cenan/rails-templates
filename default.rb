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

create_file 'bin/server' do <<-EOF
#!/bin/bash

echo "Starting development server on port 4004"
bin/rails server -b 0.0.0.0 -p4004
EOF
end

run "chmod +x bin/server"

create_file 'bin/create_secrets_yml' do <<-EOF
#/bin/bash

echo "creating config/secrets.yml"
echo "development:\n  secret_key_base: $(bin/rake secret)" > config/secrets.yml
EOF
end

run "chmod +x bin/create_secrets_yml"

