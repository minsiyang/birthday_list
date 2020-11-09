require 'time'
require_relative './birthday'
require_relative './printer'

class BirthdayList

  attr_reader :bday, :list

  def initialize(printer = Printer.new, bday = Birthday.new)
    @list = []
    @printer = printer
    @bday = bday
  end

  def store_birthday(name, date)
    @list << bday.create(name, date)
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
