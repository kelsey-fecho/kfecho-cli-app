require_relative "../../config/environment.rb"
class Scraper
  #This class scrapes a page and returns a WineList object
  attr_accessor :winelist, :doc
  def initialize(url)
    @winelist = WineList.new
    @winelist.url = url
    @doc = Nokogiri::HTML(open(url))
  end

  def scrape
    scrape_details
    @winelist #=> This instance should have a bunch of wines and details
  end

  def scrape_details
    @winelist.list_type = @doc.css(".list-seo-heading").text
  end
end
