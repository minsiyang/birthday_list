require 'birthday_list'
require 'timecop'

RSpec.describe BirthdayList do
  let(:printer) { instance_double("Printer") }
  let(:birthday_one) { instance_double("Birthday", name: "Annie Hall", date: "19/08/2019")}
  let(:birthday_two) { instance_double("Birthday", name: "Jack Lee", date: "29/07/1988")}
  let(:birthday_class) { class_double("Birthday", new: instance_double("Birthday"))}
  let(:list) { BirthdayList.new(printer, birthday_class) }

  describe "#store_birthday" do
    it "can store birthdays" do
      expect(birthday_class).to receive(:new).with("Annie Hall", "19/08/2019")
      list.store_birthday("Annie Hall", "19/08/2019")
      expect(birthday_class).to receive(:new).with("Jack Lee", "29/07/1988")
      list.store_birthday("Jack Lee", "29/07/1988")
    end
  end

  describe "#view_birthday" do
    it "output the stored birthdays one at each line" do
      allow(birthday_class).to receive(:new).with("Annie Hall", "19/08/2019").and_return(birthday_one)
      list.store_birthday("Annie Hall", "19/08/2019")
      allow(birthday_class).to receive(:new).with("Jack Lee", "29/07/1988").and_return(birthday_two)
      list.store_birthday("Jack Lee", "29/07/1988")
      expect(birthday_one).to receive(:name).and_return("Annie Hall")
      expect(birthday_one).to receive(:date).and_return("19/08/2019")
      expect(birthday_two).to receive(:name).and_return("Jack Lee")
      expect(birthday_two).to receive(:date).and_return("29/07/1988")
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
