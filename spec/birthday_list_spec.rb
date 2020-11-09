require 'birthday_list'
require 'timecop'

RSpec.describe BirthdayList do
  let(:printer) { instance_double("Printer") }
  let(:bday) { class_double("Birthday") }
  let(:list) { BirthdayList.new(printer, bday) }

  

  # before(:each) do
  #   list.store_birthday("Annie Hall", "19/08/2019")
  #   list.store_birthday("Jack Lee", "29/07/1988")
  # end

  describe "#view_birthday" do
    it "output the stored birthdays one at each line" do
      expect(bday).to receive(:new).with("Annie Hall", "19/08/2019")
      list.store_birthday("Annie Hall", "19/08/2019")
      expect(bday).to receive(:new).with("Jack Lee", "29/07/1988")
      list.store_birthday("Jack Lee", "29/07/1988")
      p list.list
      expect(list.list[0]).to receive(:name).and_return("Annie Hall")
      expect(list.list[0]).to receive(:date).and_return("19/08/2019")
      expect(printer).to receive(:print_birthday).with("Annie Hall", "19/08/2019")
      expect(printer).to receive(:print_birthday).with("Jack Lee", "29/07/1988")
      list.view_birthday
    end 
  end

  describe "#check_birthday" do
    xit "output a string to the name of the lucky person, and their age" do
      Timecop.freeze("19/08/2020") do
        list.store_birthday(Birthday.new("Annie Hall", "19/08/2019"))
        list.store_birthday(Birthday.new("Jack Lee", "29/07/1988"))
        expect(bday).to receive(:today?).with("19/08/2019").and_return(true)
        expect(bday).to receive(:today?).with("29/07/1988").and_return(false)
        expect(bday).to receive(:age).with("19/08/2019").and_return(1)
        expect(printer).to receive(:print_age).with("Annie Hall", 1)
        list.check_birthday
      end
    end

    xit "would not output anything if no birthday match the current day" do
      expect(bday).to receive(:today?).with("19/08/2019").and_return(false)
      expect(bday).to receive(:today?).with("29/07/1988").and_return(false)
      list.check_birthday
    end
  end
end
