#
# Default Rails application template
#

# Set up the template engine and test framework to use when generating
# new resources in the course of development.
initializer "generators.rb", <<-RUBY
Rails.application.config.generators do |g|
  g.template_engine :haml
  g.test_framework :rspec, fixtures: true, fixture_location: "spec/fixtures"
end
RUBY

# Create a Procfile for running the server and other workers as they
# become available.
file "Procfile" do
  <<-RUBY
web: bundle exec rails server puma
  RUBY
end

# Set up the shell environment and Travis-CI configuration
%w(env travis.yml).each do |name|
  file(".#{name}") { IO.read File.expand_path("~/etc/rails/template/#{name}") }
end

# Generate the README and remove the default one
file("README.md") { "# #{app_name.titleize}" }
run "rm -rf README.rdoc"

# Set up the database
run "createuser -s #{app_name}"

# Remove the Rails tests
run "rm -rf test/"

# Remove unnecessary default files
run "rm -rf public/index.html"

# Reset Gemfile
run "rm -rf Gemfile && cp ~/etc/rails/template/Gemfile Gemfile"

# Initialize the repository
run "git init && git add . && git commit -am 'Initial commit.'"
