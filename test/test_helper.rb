require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require 'dragons_dream'

MiniTest::Reporters.use! [MiniTest::Reporters::DefaultReporter.new, MiniTest::Reporters::GuardReporter.new]
