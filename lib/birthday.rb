require 'time'

class Birthday
  
  def birthday(date)
    Time.parse(date)
  end

  def today?(date)
    birthday(date).strftime("%d/%m") == today.strftime("%d/%m")
  end

  def age(date)
    today.year - birthday(date).year
  end

  private

  def today
    Time.now
  end
end
