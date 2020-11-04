require 'birthday_list'
require 'timecop'

RSpec.describe BirthdayList do
  let(:bday) { instance_double("Birthday")}
  let(:list) { BirthdayList.new(bday)}

  describe '#store_birthday' do
    it "stores the provided birthday into an array" do
      list.store_birthday("Annie Hall", "19/08/2019")
      expect(list.list).to eq({"Annie Hall" => "19/08/2019"})
    end
  end
 
  describe "#view_birthday" do
    it "output the stored birthdays one at each line" do
      list.store_birthday("Annie Hall", "19/08/2019")
      list.store_birthday("Jack Lee", "29/07/1988")
      expect{ list.view_birthday }.to output("Annie Hall's birthday is 19/08/2019\nJack Lee's birthday is 29/07/1988\n")
      .to_stdout
    end 
  end

  describe "#check_birthday" do
    it "output a string to the name of the lucky person, and their age" do
      Timecop.freeze("19/08/2020") do
        list.store_birthday("Annie Hall", "19/08/2019")
        list.store_birthday("Jack Lee", "29/07/1988")
        allow(bday).to receive(:today?).with("19/08/2019")
        allow(bday).to receive(:today?).with("29/07/1988")
        allow(bday).to receive(:age).with("19/08/2019")
        allow(bday).to receive(:age).with("29/07/1988")
        list.check_birthday
      end
    end

    it "would not output anything if no birthday match the current day" do
      list.store_birthday("Annie Hall", "19/08/2019")
      list.store_birthday("Jack Lee", "29/07/1988")
      allow(bday).to receive(:today?).with("19/08/2019")
      allow(bday).to receive(:today?).with("29/07/1988")
      allow(bday).to receive(:age).with("19/08/2019")
      allow(bday).to receive(:age).with("29/07/1988")
      list.check_birthday
    end
  end
end
