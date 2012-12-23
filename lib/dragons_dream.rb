require "dragons_dream/version"

module DragonsDream
  class TransferInfo
    
  end

  class RailwayInfo
    def initialize
      @baseUrl  = "http://express.heartrails.com/api/json"
    end

    def get_stations(name)
      reqUrl = "#{baseUrl}?method=getStations&name=#{name}"
      status = request(reqUrl)
    end

    def get_line(line)
      reqUrl = "#{baseUrl}?method=getStations$line=#{line}"
      status = request(reqUrl)
    end

    def get_stations_with_line(name, line)
      reqUrl = "#{baseUrl}?method=getStations&line=#{line}&name=#{name}"
      status = request(reqUrl)
    end

    def request(url)
      response = Net::HTTP.get_response(URI.parse(url))
      JSON.parse(response.body)
    end
  end
end
