class SearchesController < ApplicationController

  def create
    params[:clans].each do |clan|
      klass = "#{clan}Scraper".constantize
      # thread.new { klass.new }
      Delayed::Job.enqueue(ScraperJob.new(klass))
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

class ScraperJob < Struct.new(:klass)
  def perform
    klass.new
  end
end
