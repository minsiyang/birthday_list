require 'birthday_list'

describe "BirthdayList Feature" do
  it "can store name and according birthday into a list" do
    list = BirthdayList.new
    list.store_birthday("Annie Hall", "19/08/2019")
    list.store_birthday("Jack Lee", "29/07/1988")
    expect(list.list).to eq({"Annie Hall" => "19/08/2019", "Jack Lee" => "29/07/1988"})
  end

  it "can print out a nice message with name and according birthday" do
    list = BirthdayList.new
    list.store_birthday("Annie Hall", "19/08/2019")
    list.store_birthday("Jack Lee", "29/07/1988")
    expect { list.view_birthday }.to output(
      "Annie Hall's birthday is 19/08/2019\nJack Lee's birthday is 29/07/1988\n").to_stdout
  end

  it "output a string to the name of the lucky person, and their age" do
    Timecop.freeze("19/08/2020") do
      list = BirthdayList.new
      list.store_birthday("Annie Hall", "19/08/2019")
      list.store_birthday("Jack Lee", "29/07/1988")
      expect { list.check_birthday }.to output(
        "It's Annie Hall's birthday today! They are 1 year(s) old!\n").to_stdout
    end
  end

  it "would not output anything if no birthday match the current day" do
    list = BirthdayList.new
    list.store_birthday("Annie Hall", "19/08/2019")
    list.store_birthday("Jack Lee", "29/07/1988")
    expect { list.check_birthday }.not_to output().to_stdout
  end
end