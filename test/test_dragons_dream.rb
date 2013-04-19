# -*- coding: utf-8 -*-
require 'test_helper'

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

  def test_guide
    assert_respond_to @transfer, :guide
  end
end

class TestRailwayInfo < MiniTest::Unit::TestCase
  include DragonsDream

  def setup
    @railway = RailwayInfo.new
    @yamanote_line = "JR山手線"
  end

  def test_initialize
    assert_instance_of RailwayInfo, RailwayInfo.new
  end

  def test_stations_list
    assert_respond_to @railway, :stations_list
    assert_raises(ArgumentError) do
      @railway.stations_list(nil)
    end
    assert_kind_of Array, @railway.stations_list(@yamanote_line)
    assert_equal 29, @railway.stations_list(@yamanote_line).length
  end
end

describe DragonsDream::RailwayInfo do
  before do
    @railway = DragonsDream::RailwayInfo.new
    @yamanote_line = "JR山手線"
  end

  describe "get_stations" do
    it "is private method" do
      @railway.wont_respond_to("get_stations")
    end

    describe "with send" do
      it "returns Hash" do
        @railway.send(:get_stations, nil).must_be_kind_of(Hash)
      end
      
      it "raise ArgumentError with Argument nil" do
        lambda{@railway.send(:get_stations, nil)}.must_raise(ArgumentError)
      end
    end
  end

  describe "get_line" do
    it "is private method" do
      @railway.wont_respond_to("get_line")
    end

    describe "with send" do
      it "raise ArgumentError with Argument nil" do
        lambda{@railway.send(:get_line, nil)}.must_raise(ArgumentError)
      end

      it "returns Hash" do
        @railway.send(:get_line, @yamanote_line).must_be_kind_of(Hash)
      end
    end
  end

  describe "get_stations_with_line" do
    it "is private method" do
      @railway.wont_respond_to("get_stations_with_line")
    end
    describe "with send" do
      it "returns Hash" do
        @railway.send(:get_stations_with_line, nil, nil).must_be_kind_of(Hash)
      end
    end
  end
end
