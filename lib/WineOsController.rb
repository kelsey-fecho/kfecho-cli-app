class WineOsController
  def initialize
    puts "Hey, wine lover!"

    red = Scraper.new("http://www.totalwine.com/wine/red-wine/c/000009?viewall=true").scrape
    champ = Scraper.new("http://www.totalwine.com/wine/champagne-sparkling-wine/champagne/c/000162").scrape
    rose = Scraper.new("http://www.totalwine.com/wine/rose-blush-wine/c/000063").scrape
    @list = WineList.all
  end

  def call
    input = ''
    while input != 'exit'
      puts "What would you like to do? \n Enter 'list all', 'list by type', 'list by country', or 'list by rating'."
      input = gets.strip.downcase
      case input
      when "list all"
        list_wines
      when "list by type"
        puts "What type of wine are you feeling? Select a number below"
        types
        input2 = gets.strip.to_i
        list_wines_by_type(input2)
      when "list by country"
        puts "Alright, let's explore! Choose a region by number:"
        regions
        input3 = gets.strip.to_i
        list_wines_by_region(input3)
      when "list by rating"
      when "exit"
        puts "See you later!"
        break
      else
        "Sorry, I'm not sure what you mean. Enter 'list all', 'list by type', 'list by region', or 'list by rating'."
      end
    end
  end

  def list_wines
    @list.each.with_index(1) do |a, i|
      puts "#{i}. #{a.title} - #{a.price} - #{a.rating}"
    end
  end

  def types
    @t = @list.collect{|wine| wine.category}.uniq
    @t.each.with_index(1) do |a, i|
      puts "#{i}. #{a}"
    end
  end

  def list_wines_by_type(input)
    num = 1
    @list.each do |wine|
      if wine.category == @t[input-1]
          puts "#{num}. #{wine.title} - #{wine.price} - #{wine.rating}"
          num += 1
        end
      end
    end

    def regions
      @c = @list.collect{|wine| wine.country}.uniq
      @c.each.with_index(1) do |a, i|
        puts "#{i}. #{a}"
      end
    end

    def list_wines_by_region(input)
      num = 1
      @list.each do |wine|
        if wine.region == @c[input-1]
            puts "#{num}. #{wine.title} - #{wine.price} - #{wine.rating}"
            num += 1
          end
        end
      end
end
