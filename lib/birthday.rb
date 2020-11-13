require 'time'

class Birthday
  attr_reader :name, :date

  def initialize(name, birthday)
    @name = name
    @date = birthday
  end
  
  def age
    today.year - Time.parse(date).year
  end

  private

  def today
    Time.now
  end

end
