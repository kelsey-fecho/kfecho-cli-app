class WineList
  #This class creates new lists of individual wines from a webpage
  attr_accessor :wines, :list_type, :url

  def initialize
    @wines = []
  end

  def add_wine(wine)
    @wines << wine
  end

end