class WineList
  #This class creates new lists of individual wines from a webpage
  attr_accessor :wines, :list_type

  def initialize
    @wines << self
  end

end
