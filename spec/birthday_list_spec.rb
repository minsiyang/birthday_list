require 'birthday_list'
require 'timecop'

RSpec.describe BirthdayList do
  let(:bday) { instance_double("Birthday") }
  let(:printer) { instance_double("Printer") }
  let(:list) { BirthdayList.new(bday, printer) }

  before(:each) do
    list.store_birthday("Annie Hall", "19/08/2019")
    list.store_birthday("Jack Lee", "29/07/1988")
  end

  describe "#view_birthday" do
    it "output the stored birthdays one at each line" do
      expect(printer).to receive(:print_birthday).with("Annie Hall", "19/08/2019")
      expect(printer).to receive(:print_birthday).with("Jack Lee", "29/07/1988")
      list.view_birthday
    end 
  end

  describe "#check_birthday" do
    it "output a string to the name of the lucky person, and their age" do
      Timecop.freeze("19/08/2020") do
        expect(bday).to receive(:today?).with("19/08/2019").and_return(true)
        expect(bday).to receive(:today?).with("29/07/1988").and_return(false)
        expect(bday).to receive(:age).with("19/08/2019").and_return(1)
        expect(printer).to receive(:print_age).with("Annie Hall", 1)
        list.check_birthday
      end
    end

    it "would not output anything if no birthday match the current day" do
      expect(bday).to receive(:today?).with("19/08/2019").and_return(false)
      expect(bday).to receive(:today?).with("29/07/1988").and_return(false)
      list.check_birthday
    end
  end
end
