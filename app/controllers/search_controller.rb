class SearchController < ApplicationController
  def index
    station = params[:zip]
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-API-KEY"] = "cNukGUOWc3A8fesy21FkFHMEbQ9DkVnwSVMtrs94"
      faraday.adapter Faraday.default_adapter
  end
end
