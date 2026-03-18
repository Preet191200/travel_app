class CountriesController < ApplicationController
  def index
    @countries = Country.all

    if params[:search].present?
      @countries = @countries.where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:population].present?
      case params[:population]
      when "small"
        @countries = @countries.where("population < ?", 10_000_000)
      when "medium"
        @countries = @countries.where("population >= ? AND population <= ?", 10_000_000, 50_000_000)
      when "large"
        @countries = @countries.where("population > ?", 50_000_000)
      end
    end
  end

  def show
    @country = Country.find(params[:id])
    @cities = @country.cities
  end
end