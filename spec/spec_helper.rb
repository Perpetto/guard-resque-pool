require 'rspec'
require 'guard/compat/test/helper'
require 'guard/resque-pool'

ENV['GUARD_ENV'] = 'test'

RSpec.configure do |config|
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end
