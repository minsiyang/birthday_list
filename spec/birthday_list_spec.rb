require 'birthday_list'

RSpec.describe BirthdayList do
  describe '#store_birthday' do
    it "stores the provided birthday, and return a confirm message" do
      expect(subject.store_birthday("Annie Hall", "19/08/2020")).to eq("Birthday has been stored!")
    end
  end

  describe "#view_birthday" do
    it "output the stored birthdays one at each line" do
      list = BirthdayList.new
      list.store_birthday("Annie Hall", "19/08/2020")
      list.store_birthday("Jack Lee", "29/07/1988")
      expect{ list.view_birthday }.to output("Annie Hall's birthday is 19/08/2020\nJack Lee's birthday is 29/07/1988\n")
      .to_stdout
    end 
  end
end
