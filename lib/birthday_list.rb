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

  def check_birthday
    today = Time.now
    year = today.year
    @list.each do |name, birthday|
      if Time.parse(birthday).strftime("%d/%m") == today.strftime("%d/%m")
        age = year - Time.parse(birthday).year
        puts "It's #{name}'s birthday today! They are #{age} year(s) old!"
      end
    end
  end
end
