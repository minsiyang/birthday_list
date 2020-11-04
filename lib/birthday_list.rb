require 'time'
require_relative './birthday'

class BirthdayList
  attr :list

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
      puts "It's #{name}'s birthday today! They are #{@bday.age(birthday)} year(s) old!" if @bday.today?(birthday)
    end
  end
end
