require 'time'
require_relative './birthday'
require_relative './printer'

class BirthdayList

  def initialize(printer = Printer.new)
    @list = []
    @printer = printer
  end

  def store_birthday(birthday)
    @list << birthday
  end

  def view_birthday
    @list.each do |birthday|
      @printer.print_birthday(birthday.name, birthday.date) 
    end
  end

  def check_birthday
    @list.each do |name, birthday|
      @printer.print_age(name, @bday.age(birthday)) if @bday.today?(birthday)
    end
  end
end
