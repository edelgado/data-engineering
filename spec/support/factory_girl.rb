# Factory linting. See https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md#linting-factories

# FactoryGirl.lint builds each factory and subsequently calls #valid? on it (if #valid? is defined); if any 
# calls to #valid? return false, FactoryGirl::InvalidFactoryError is raised with a list of the offending factories. 
# Recommended usage of FactoryGirl.lint is to invoke this once before the test suite is run.

# DatabaseCleaner is provided by the 'database_cleaner' gem.

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction    
    DatabaseCleaner.clean_with(:truncation)
    FactoryGirl.lint
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end