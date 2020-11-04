require 'birthday'
require 'timecop'

RSpec.describe Birthday do
  it 'knows it is date' do
    bday = Birthday.new
    result = bday.birthday("19/08/2020")
    actual = Time.parse("19/08/2020")
    expect(result).to eq(actual)
  end

  it 'will return false if today is not the birthday' do
    bday = Birthday.new
    bday.birthday("19/08/2020")
    expect(bday.today?("19/08/2020")).to eq false
  end

  it 'will return true if today is the birthday' do
    Timecop.freeze("19/08/2020") do
      bday = Birthday.new
      bday.birthday("19/08/2020")
      expect(bday.today?("19/08/2020")).to eq true
    end
  end

  it 'can return the age' do
    bday = Birthday.new("19/08/2019")
    result = bday.age
    expect(result).to eq 1
  end
end