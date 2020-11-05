require 'time'
require_relative './birthday'
require_relative './printer'

class BirthdayList
  attr :list

  def initialize(bday = Birthday.new, printer = Printer.new)
    @list = {}
    @bday = bday
    @printer = printer
  end

  def store_birthday(name, birthday)
    @list[name] = birthday
  end

  def view_birthday
    @list.each do |name, birthday|
      @printer.print_birthday(name, birthday) 
    end
  end

  def check_birthday
    @list.each do |name, birthday|
      puts "It's #{name}'s birthday today! They are #{@bday.age(birthday)} year(s) old!" if @bday.today?(birthday)
    end
  end
end
