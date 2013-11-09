require_relative 'rg'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/colorize'

# extend Spec-like sytax
class MiniTest::Unit::TestCase
	class << self
		alias :context :describe
	end
end