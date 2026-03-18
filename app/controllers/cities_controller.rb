class CitiesController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @cities = @country.cities
  end

  def show
    @city = City.find(params[:id])
    @attractions = @city.attractions
  end
end