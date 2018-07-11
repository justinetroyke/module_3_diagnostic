class SearchController < ApplicationController
  def index
    station = Search.create(search_params)
    @conn = Faraday.new(url: 'https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=E85,ELEC&state=CA&limit=2&') do |faraday|
      faraday.headers["X-API-KEY"] = "cNukGUOWc3A8fesy21FkFHMEbQ9DkVnwSVMtrs94"
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("api/alt-fuel-stations/v1.json/current.json")
    binding.pry
    @stations = JSON.parse(response.body, symbolize_names: true)[:results]
  end

private
  def search_params
    params.permit(:zip_code)
  end
end
