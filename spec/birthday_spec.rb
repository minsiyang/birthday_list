require 'birthday'
# require 'timecop'

RSpec.describe Birthday do
  it "knows the name for the birthday" do
    bday = Birthday.new("Annie Hall", "19/08/2019")
    expect(bday.name).to eq("Annie Hall")
  end

  it "knows the date of the birthday" do
    bday = Birthday.new("Annie Hall", "19/08/2019")
    expect(bday.date).to eq("19/08/2019")
  end

  it "knows the age of the birthday" do
    bday = Birthday.new("Annie Hall", "19/08/2019")
    expect(bday.age).to eq(1)
  end

  # it 'will return false if today is not the birthday' do
  #   bday.birthday("19/08/2020")
  #   expect(bday.today?("19/08/2020")).to eq false
  # end

  # it 'will return true if today is the birthday' do
  #   Timecop.freeze("19/08/2020") do
  #     bday.birthday("19/08/2020")
  #     expect(bday.today?("19/08/2020")).to eq true
  #   end
  # end

  # it 'can return the age' do
  #   bday.birthday("19/08/2019")
  #   result = bday.age("19/08/2019")
  #   expect(result).to eq 1
  # end
end