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
    scrape_wines
    @winelist #=> This instance should have a bunch of wines and details
  end

  def scrape_details
    @winelist.list_type = @doc.css(".list-seo-heading").text
  end

  def scrape_wines
    @doc.search("section.plp-product-content ul.plp-list li").each do |wine|
      w = Wine.new
      w.title = wine.search(".plp-product-title").text.strip
      w.size = wine.search(".plp-product-qty").text.strip
      w.price = wine.search("div.plp-product-buy-price-mix span.price").text.strip
      #w.rating =
      w.link = wine.search(".plp-product-title").attr("href")
      w.category = @winelist.list_type
      w.region = wine.search(".analyticsCountryState").text
      @winelist.add_wine(w)
    end
  end
end
