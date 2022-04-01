require 'net/http'
class MapController < ApplicationController
  def index

    uri = URI("https://api.citybik.es/v2/networks")
    response = Net::HTTP.get_response(uri)



    p"****************************************************************************************"

    data = JSON.parse(response.body)
    @arraypoint = []
    @arrayinfo = []
    p data["networks"][1]
    for item in data["networks"]
      tempopoint = [item["location"]["latitude"], item["location"]["longitude"]]
      tempoinfo =  [item["name"], item["location"]["city"], item["location"]["country"]]
      @arraypoint.push(tempopoint)
      @arrayinfo.push(tempoinfo)
    end

    for key, value in data["networks"][1]
      p "#{key} => #{value}"
      if key == "location"
        p data["networks"][1]["location"]["latitude"]
        p data["networks"][1]["location"]["longitude"]
      end
    end
    @arraycenter = [data["networks"][1]["location"]["latitude"], data["networks"][1]["location"]["longitude"]]
  end
end
