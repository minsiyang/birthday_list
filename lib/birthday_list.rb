class BirthdayList
  def initialize
    @list = {}
  end

  def store_birthday(name, birthday)
    @list[name] = birthday
    "Birthday has been stored!"
  end

  def view_birthday
    @list.each do |name, birthday|
      puts "#{name}'s birthday is #{birthday}"
    end
  end
end
