# -*- coding: utf-8 -*-
require File.expand_path 'test_helper', File.dirname(__FILE__)

class TestDragonsDream < MiniTest::Unit::TestCase
  include DragonsDream
end

class TestTransferInfo < MiniTest::Unit::TestCase
  include DragonsDream

  def setup
    @transfer = TransferInfo.new
  end

  def test_initialize
    assert_instance_of TransferInfo, TransferInfo.new
  end
end
