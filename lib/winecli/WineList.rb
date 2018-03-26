class WineList
  #This class creates new lists of individual wines from a webpage
  attr_accessor :wines, :list_type, :url
  @@all = []
  def initialize
    @wines = []
  end

  def add_wine(wine)
    @wines << wine
    @@all << wine if !@@all.include? wine
  end

  def self.all
    @@all
  end

end
