require 'birthday'
require 'timecop'

RSpec.describe Birthday do
  let(:bday) { Birthday.new }

  it 'will return false if today is not the birthday' do
    bday.birthday("19/08/2020")
    expect(bday.today?("19/08/2020")).to eq false
  end

  it 'will return true if today is the birthday' do
    Timecop.freeze("19/08/2020") do
      bday.birthday("19/08/2020")
      expect(bday.today?("19/08/2020")).to eq true
    end
  end

  it 'can return the age' do
    bday.birthday("19/08/2019")
    result = bday.age("19/08/2019")
    expect(result).to eq 1
  end
end