class CountriesController < ApplicationController
  def index
    if params[:search].present?
      @countries = Country.where("name LIKE ? OR region LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @countries = Country.all
    end
  end

  def show
    @country = Country.find(params[:id])
    @cities = @country.cities
  end
end
