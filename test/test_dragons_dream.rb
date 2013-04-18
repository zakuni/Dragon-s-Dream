# -*- coding: utf-8 -*-
require 'test_helper'

describe DragonsDream do
  describe "guide" do
    it "shows the way" do
      true
    end
  end
end

describe DragonsDream::TransferInfo do
  before do
    @transfer = DragonsDream::TransferInfo.new
  end

  it "can be created" do
    DragonsDream::TransferInfo.new.must_be_instance_of DragonsDream::TransferInfo
  end

  describe "guide" do
    it "responds" do 
      @transfer.must_respond_to("guide")
    end

    it "returns" do
      puts @transfer.guide("江田（神奈川）", "大阪")
    end
  end
end

describe DragonsDream::RailwayInfo do
  before do
    @railway = DragonsDream::RailwayInfo.new
    @yamanote_line = "JR山手線"
  end

  it "can be created" do
    DragonsDream::RailwayInfo.new.must_be_instance_of DragonsDream::RailwayInfo
  end

  describe "stations_list" do
    it "responds" do
      @railway.must_respond_to("stations_list")
    end

    it "raise ArgumentError with Argument nil" do
      lambda{@railway.stations_list(nil)}.must_raise(ArgumentError)
    end

    describe "with JR山手線" do
      it "returns Array" do
        @railway.stations_list(@yamanote_line).must_be_kind_of(Array)
      end

      it "has 29 stations" do
        @railway.stations_list(@yamanote_line).length.must_equal(29)
      end
    end
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
