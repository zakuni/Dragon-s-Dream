# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'minitest/reporters'
require 'dragons_dream'

MiniTest::Reporters.use! [MiniTest::Reporters::SpecReporter.new]

describe DragonsDream do
  describe "guide" do
    it "shows the way" do
      true
    end
  end
end

describe DragonsDream::TransferInfo do
  it "can be created" do
    DragonsDream::TransferInfo.new.must_be_instance_of DragonsDream::TransferInfo
  end
end

describe DragonsDream::RailwayInfo do
  before do
    @railway = DragonsDream::RailwayInfo.new
  end

  it "can be created" do
    DragonsDream::RailwayInfo.new.must_be_instance_of DragonsDream::RailwayInfo
  end
  
  describe "get_stations" do
    it "has method get_stations" do
      @railway.must_respond_to("get_stations")
    end

    it "returns Hash" do
      @railway.get_stations(nil).must_be_kind_of(Hash)
    end
  end

  describe "get_line" do
    it "has method get_line" do
      @railway.must_respond_to("get_line")
    end

    it "returns Hash" do
      @railway.get_line(nil).must_be_kind_of(Hash)
    end
  end

  describe "get_stations_with_line" do
    it "has method get_stations_with_line" do
      @railway.must_respond_to("get_stations_with_line")
    end

    it "returns Hash" do
      @railway.get_stations_with_line(nil, nil).must_be_kind_of(Hash)
    end
  end
end
