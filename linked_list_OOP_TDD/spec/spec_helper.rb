require 'node'
require 'list'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # Disable the 'should' syntax as of RSpec 2.11
    c.syntax = :expect
  end
end
