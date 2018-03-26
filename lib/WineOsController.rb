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
      puts "What would you like to do? \n Enter 'list all', 'list by type', 'list by region', or 'list by rating'."
      input = gets.strip
      case input
      when "list all"
        list_wines
      when "list by type"
        puts "What type of wine are you feeling? Select a number below"
        types
        input2 = gets.strip.to_i
        list_wines_by_type(input2)
      when "list by region"
      when "list by rating"
      when "exit"
        puts "See you later!"
        break
      end
    end
  end

  def list_wines
    @list.each.with_index(1) do |a, i|
      puts "#{i}. #{a.title}"
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
          puts "#{num}. #{wine.title}"
          num += 1
        end
      end
    end
end
