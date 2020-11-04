require 'time'
require_relative './birthday'

class BirthdayList

  def initialize(bday)
    @list = {}
    @bday = bday
  end

  def store_birthday(name, birthday)
    @list[name] = birthday
  end

  def view_birthday
    @list.each do |name, birthday|
      puts "#{name}'s birthday is #{birthday}"  
    end
  end

  def check_birthday
    @list.each do |name, birthday|
      puts "It's #{name}'s birthday today! They are #{age(birthday)} year(s) old!" if today?(birthday)
    end
  end

  private

  def today
    Time.now
  end

  def today?(birthday)
    birthday(birthday).strftime("%d/%m") == today.strftime("%d/%m")
  end

  def age(birthday)
    today.year - birthday(birthday).year
  end

  def birthday(birthday)
    Time.parse(birthday)
  end

end
