class WineOsController
  def initialize
    puts "Welcome to TotalWines!"

    test = Scraper.new("http://www.totalwine.com/wine/red-wine/c/000009?viewall=true").scrape
    champ = Scraper.new("http://www.totalwine.com/wine/champagne-sparkling-wine/champagne/c/000162").scrape
    rose = Scraper.new("http://www.totalwine.com/wine/rose-blush-wine/c/000063").scrape
    @list = WineList.all
  end

  def call
    input = ''
    while input != 'exit'
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list"
        list_wines
      end
    end
  end

  def list_wines
    @list.each.with_index(1) do |a, i|
      puts "#{i}. #{a.title}"
    end
  end
end
