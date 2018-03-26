require_relative "../../config/environment.rb"
class Scraper
  #This class scrapes a page and returns a WineList object
  attr_accessor :winelist, :doc
  def initialize(url)
    @winelist = WineList.new
    @doc = Nokogiri::HTML(open(url))
  end

end
