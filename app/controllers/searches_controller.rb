class SearchesController < ApplicationController

  def create
    params[:clans].each do |clan|
      klass = "#{clan}Scraper".constantize
      # thread.new { klass.new }
      klass.delay.new
    end
  end

  def new
    @clans = ["Xxl",
              "Sourceop",
              "Drunkenbombers",
              "Hyperiongaming",
              "Intoxgaming",
              "Lotus"]
  end

end
