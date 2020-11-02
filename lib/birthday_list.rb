class BirthdayList

  def initialize
    @list = []
  end

  def store_birthday(name, birthday)
    @list << { name: name, birthday: birthday}
  end

  def view_birthday
    @list.each do |person|
      puts "#{person[:name]}'s birthday is #{person[:birthday]}"  
    end
  end

  def check_birthday
    @list.each do |person|
      puts "It's #{person[:name]}'s birthday today! They are #{age(person[:birthday])} "\
      "year(s) old!" if today?(person[:birthday])
    end
  end

  private

  def today
    Time.now
  end

  def today?(birthday)
    birthday(birthday).strftime("%d/%m") == today.strftime("%d/%m")
  end

  def age(birthday)
    today.year - birthday(birthday).year
  end

  def birthday(birthday)
    Time.parse(birthday)
  end

end
