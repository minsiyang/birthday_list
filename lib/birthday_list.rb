require_relative './birthday'
require 'time'

class BirthdayList

  def initialize(birthday)
    @list = []
    @birthday = birthday
  end

  def store_birthday(name, birthday)
    @list << @birthday.new(name, birthday)
  end

  def view_birthday
    @list.each do |bday|
      puts "#{bday.name}'s birthday is #{bday.birthday}"  
    end
  end

  def check_birthday
    @list.each do |bday|
      puts "It's #{bday.name}'s birthday today! He/She is #{age(bday.birthday)} "\
      "year(s) old!" if today?(bday.birthday)
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
