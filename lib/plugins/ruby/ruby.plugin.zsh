# TODO: Make this compatible with rvm.
#       Run sudo gem on the system ruby, not the active ruby.
alias sgem='sudo gem'

# Find ruby file
alias rfind='find . -name "*.rb" | xargs grep -n'

# Run a single Ruby test using `ruby -Itest`. This is the built-in testing
# framework that ships with Ruby 1.9 and is useful for running quick tests
# that don't require database connectivity or awareness of the Rails app.
#
# Thanks @robdimarco
rbtest() {
  if [ -f $1 ]; then
    bundle exec ruby -Itest $@;
  else
    echo "Please specify a file(s) to test"
  fi;
}


# Run a single Ruby test using Rake. This will also migrate the database and
# generally prepare the environment for testing, and is useful for tests
# which require a specific database setup to function.
#
# Thanks @robdimarco
rbtest_with_rake() {
  if [ -f $1 ]; then
    case `echo $1 | cut -f 2 -d '/'` in
      unit)
        task='test:units'
        ;;
      functional)
        task='test:functionals'
        ;;
      integration)
        task='test:integration'
        ;;
      *)
        task='test'
        ;;
    esac
    bundle exec rake $task TEST1
  else
    bundle exec rake test
  fi
}
