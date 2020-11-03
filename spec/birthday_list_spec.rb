require 'birthday_list'
require 'timecop'

RSpec.describe BirthdayList do
  describe '#store_birthday' do
    it "stores the provided birthday into an array" do
      bd = class_double("Birthday")
      list = BirthdayList.new(bd)
      expect(bd).to receive(:new).with("Annie Hall", "19/08/2019")
      list.store_birthday("Annie Hall", "19/08/2019")
      # expect(subject.store_birthday("Annie Hall", "19/08/2020")).to eq([{ name: "Annie Hall", birthday: "19/08/2020"}])
    end
  end
 
  describe "#view_birthday" do
    it "output the stored birthdays one at each line" do
      bd = class_double("Birthday")
      list = BirthdayList.new(bd)
      expect(bd).to receive(:new).with("Annie Hall", "19/08/2019")
      list.store_birthday("Annie Hall", "19/08/2019")
      expect(bd).to receive(:new).with("Jack Lee", "29/07/1988")
      list.store_birthday("Jack Lee", "29/07/1988")
      # allow(bd).to receive(:name)
      # allow(bd).to receive(:birthday)
      list.view_birthday
      # expect { list.view_birthday }.to output("Annie Hall's birthday is 19/08/2019\nJack Lee's birthday is 29/07/1988\n")
      # .to_stdout
    end 
  end

  describe "#check_birthday" do
    xit "output a string to the name of the lucky person, and their age" do
      Timecop.freeze("19/08/2020") do
        list = BirthdayList.new
        list.store_birthday("Annie Hall", "19/08/2019")
        list.store_birthday("Jack Lee", "29/07/1988")
        expect { list.check_birthday }.to output("It's Annie Hall's birthday today! They are 1 year(s) old!\n").to_stdout
      end
    end

    xit "would not output anything if no birthday match the current day" do
      list = BirthdayList.new
      list.store_birthday("Annie Hall", "19/08/2019")
      list.store_birthday("Jack Lee", "29/07/1988")
      expect { list.check_birthday }.to output("").to_stdout
    end
  end
end
