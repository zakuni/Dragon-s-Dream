require 'net/http'
require 'json'
require 'open-uri'
require 'nokogiri'
require 'dragons_dream/railwayinfo'
require 'dragons_dream/version'

module DragonsDream
  class TransferInfo
    def guide(station1, station2)
      enc_s1 = URI.encode(station1)
      enc_s2 = URI.encode(station2)
      doc = Nokogiri::HTML(open("http://www.jorudan.co.jp/norikae/cgi/nori.cgi?rf=top&eok1=&eok2=&pg=0&eki1=#{enc_s1}&Cmap1=&eki2=#{enc_s2}&Dym=201301&Ddd=2&Dhh=16&Dmn1=0&Dmn2=5&Cway=1&S.x=17&S.y=27&Csg=1"))
      routes = doc.xpath('//div[@id="results"]/div[@id="bR1"]/div[@class="route"]')
      ekis = Array.new(routes.xpath('//tr[@class="eki eki_s"]//strong'))
      ekis.push(routes.xpath('//tr[@class="eki"]//strong'))
#      ekis.push(routes.xpath('//tr[@class="eki eki_e"]//strong'))
    end
  end
end
