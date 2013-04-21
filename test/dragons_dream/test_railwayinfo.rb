# -*- coding: utf-8 -*-
require 'test_helper'

class TestRailwayInfo < MiniTest::Unit::TestCase
  include DragonsDream

  def setup
    @railway = RailwayInfo.new
    @yamanote_line = "JR山手線"
    @shibuya = "渋谷"
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
    assert_equal "品川", stations[0]["name"]
  end

  def test_get_stations
    refute_respond_to @railway, :get_stations
    assert_kind_of Hash, @railway.send(:get_stations, @shibuya)
    assert_raises(ArgumentError) do
      @railway.send(:get_stations, nil)
    end
  end

  def test_get_line
    refute_respond_to @railay, :get_line
    assert_kind_of Hash, @railway.send(:get_line, @yamanote_line)
    assert_raises(ArgumentError) do
      @railway.send(:get_line, nil)
    end
  end

  def test_get_stations_with_line
    refute_respond_to @railway, :get_stations_with_line
    assert_instance_of Hash, @railway.send(:get_stations_with_line, @shibuya, @yamanote_line)
    assert_raises(ArgumentError) do
      @railway.send(:get_stations_with_line, nil, @yamanote_line)
    end
    assert_raises(ArgumentError) do
      @railway.send(:get_stations_with_line, @shibuya, nil)
    end
  end
end

