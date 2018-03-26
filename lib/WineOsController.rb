class WineOsController
  def initialize
    puts "Welcome to TotalWines!"

    test = Scraper.new("http://www.totalwine.com/wine/red-wine/c/000009?viewall=true")
    @winelist = test.scrape
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
    @winelist.wines.each.with_index(1) do |a, i|
      puts "#{i}. #{a.title}"
    end
  end
end
