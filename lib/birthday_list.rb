require 'time'
require_relative './birthday'
require_relative './printer'

class BirthdayList

  attr_reader :birthday, :list

  def initialize(printer = Printer.new, birthday = Birthday)
    @list = []
    @printer = printer
    @birthday = birthday
  end

  def store_birthday(name, date)
    @list << birthday.new(name, date)
  end

  def view_birthday
    @list.each do |birthday|
      @printer.print_birthday(birthday.name, birthday.date) 
    end
  end

  def check_birthday
    @list.each do |birthday|
      @printer.print_age(birthday.name, birthday.age) if today?(birthday.date)
    end
  end

  private

  def today?(date)
    Time.parse(date).strftime("%d/%m") == Time.now.strftime("%d/%m")
  end
end
