require 'printer'

RSpec.describe Printer do
  describe "#print_birthday" do
    it "can print out a message with the name and birthday" do
      printer = Printer.new
      expect { printer.print_birthday("Annie Hall", "19/08/2019") }.to output(
        "Annie Hall's birthday is 19/08/2019\n").to_stdout
    end
  end

  describe "#print_age" do
    it "can print out a nice message with the age" do
      printer = Printer.new
      expect { printer.print_age("Annie Hall", 1) }.to output(
        "It's Annie Hall's birthday today! They are 1 year(s) old!\n").to_stdout
    end
  end
end

