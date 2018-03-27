class WineCLIController
  def initialize
    puts "Hey, wine lover!"
    puts "Give us a second to assemble our favorite wines."

    red = Scraper.new("http://www.totalwine.com/wine/red-wine/c/000009?viewall=true").scrape
    white = Scraper.new("http://www.totalwine.com/wine/white-wine/c/000002?viewall=true").scrape
    champ = Scraper.new("http://www.totalwine.com/wine/champagne-sparkling-wine/champagne/c/000162").scrape
    rose = Scraper.new("http://www.totalwine.com/wine/rose-blush-wine/c/000063").scrape
    @list = WineList.all
  end

  def call
    input = ''
    while input != 'exit'
      puts "What would you like to do? \n Enter 'list all', 'list by type', 'list by region', or 'list by rating'."
      list_variety = gets.strip.downcase
      case list_variety
      when "list all"
        list_wines
      when "list by type"
        puts "What type of wine are you feeling? Select a number below"
        types
        list_by_type_index = gets.strip.to_i
        list_wines_by_type(list_by_type_index)
      when "list by region"
        puts "Alright, let's explore! Choose a region by number:"
        regions
        list_by_region_index = gets.strip.to_i
        list_wines_by_region(list_by_region_index)
      when "list by rating"
        list_wines_by_rating
      when "exit"
        puts "See you later!"
        break
      else
        puts "Sorry, I'm not sure what you mean. Enter 'list all', 'list by type', 'list by region', or 'list by rating'."
      end
    end
  end

  def list_wines
    @list.each.with_index(1) do |a, i|
      puts "#{i}. #{a.title} - #{a.price} - #{a.rating} Points"
    end

    puts "See anything you like? Enter a number to find out more."
    wine_detail = gets.strip
    if wine_detail == "exit"
      puts "Heading back to the menu"
    else
      pick = @list[wine_detail.to_i-1]
      display_wine(pick)
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
    @typelist = []
    @list.each do |wine|
      if wine.category == @t[input-1]
          puts "#{num}. #{wine.title} - #{wine.price} - #{wine.rating} Points"
          @typelist << wine
          num += 1
      end
    end

    puts "See anything you like? Enter a number to find out more."
    wine_detail = gets.strip
    if wine_detail == "exit"
      puts "Heading back to the menu"
    else
      pick = @typelist[wine_detail.to_i-1]
      display_wine(pick)
    end
  end

  def regions
    @c = @list.collect{|wine| wine.region}.uniq
    @c.each.with_index(1) do |a, i|
      puts "#{i}. #{a}"
    end
  end

  def list_wines_by_region(input)
    num = 1
    @regionlist = []
    @list.each do |wine|
      if wine.region == @c[input-1]
          puts "#{num}. #{wine.title} - #{wine.price} - #{wine.rating} Points"
          num += 1
          @regionlist << wine
        end
      end

    puts "See anything you like? Enter a number to find out more."
    wine_detail = gets.strip
    if wine_detail == "exit"
      puts "Heading back to the menu"
    else
      pick = @regionlist[wine_detail.to_i-1]
      display_wine(pick)
    end
  end

  def display_wine(wine)
    puts "Name: #{wine.title}"
    puts "Size: #{wine.size}"
    puts "Region: #{wine.region}"
    puts "Price: #{wine.price}"
    puts "Description: #{wine.description}"

    puts "Would you like to buy? Enter 'buy' or 'go back'"
    buy = gets.strip
    if buy == 'buy'
      system("open #{wine.link}")
      puts "#{wine.link}"
    end
  end

  def list_wines_by_rating
    sorted = @list.sort_by(&:rating).reverse
    sorted.each.with_index(1) do |a, i|
      puts "#{i}. #{a.rating} Points - #{a.title} - #{a.price}"
    end

    puts "See anything you like? Enter a number to find out more."
    wine_detail = gets.strip
    if wine_detail == "exit"
      puts "Heading back to the menu"
    else
      pick = sorted[wine_detail.to_i-1]
      display_wine(pick)
    end
  end
end
