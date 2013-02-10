class SearchesController < ApplicationController

  before_filter :require_authentication

  def create
    params[:clans].each do |clan|
      klass = "#{clan}Scraper".constantize
      # thread.new { klass.new }
      klass.delay.new
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
