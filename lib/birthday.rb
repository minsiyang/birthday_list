require 'time'

class Birthday
  def initialize(date)
    @date = date
  end
  
  def birthday
    Time.parse(@date)
  end

  def today?
    birthday.strftime("%d/%m") == today.strftime("%d/%m")
  end

  def age
    today.year - birthday.year
  end

  private

  def today
    Time.now
  end
end
