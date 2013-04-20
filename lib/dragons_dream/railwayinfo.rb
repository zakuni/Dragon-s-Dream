module DragonsDream

  class RailwayInfo
    def initialize
      @baseUrl  = "http://express.heartrails.com/api/json"
    end
    
    def stations_list(line)
      get_line(line)["station"]
    rescue
      raise ArgumentError, "line must not be nil" if line.nil?
      raise
    end

    private
    
    def get_stations(name)
      enc_name = URI.encode(name)
      reqUrl = "#{@baseUrl}?method=getStations&name=#{enc_name}"
      request(reqUrl)["response"]
    rescue
      raise ArgumentError, "name of station must not be nil" if name.nil?
      raise
    end

    def get_line(line)
      enc_line = URI.encode(line)
      reqUrl = "#{@baseUrl}?method=getStations&line=#{enc_line}"
      request(reqUrl)["response"]
    rescue
      raise ArgumentError, "line must not be nil" if line.nil?
      raise
    end

    def get_stations_with_line(name, line)
      reqUrl = "#{@baseUrl}?method=getStations&line=#{line}&name=#{name}"
      request(reqUrl)["response"]
    end

    def request(url)
      response = Net::HTTP.get_response(URI.parse(url))
      JSON.parse(response.body)
    end
  end
end
