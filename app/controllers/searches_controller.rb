class SearchesController < ApplicationController

  before_filter :require_authentication

  def create
    @clans = params[:clans]
    if @clans
      @clans.each do |clan|
        klass = "#{clan}Scraper".constantize
        klass.delay.new
      end
    else
      @clans = [""]
    end
  end

  def new
    @clans = [
              "Drunkenbombers",
              "Hyperiongaming",
              "Intoxgaming",
              "Sourceop",
              "Topnotch",
              "Xxl"
    ]
  end

end
