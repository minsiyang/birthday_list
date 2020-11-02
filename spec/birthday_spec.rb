require 'birthday'

RSpec.describe Birthday do
  it "knows the name of the birthday owner" do
    bday = Birthday.new("Annie Hall", "19/08/2020")
    expect(bday.name).to eq("Annie Hall")
  end

  it "knows the date of the birthday" do
    bday = Birthday.new("Annie Hall", "19/08/2020")
    expect(bday.birthday).to eq("19/08/2020")
  end
end