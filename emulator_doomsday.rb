@humans = 10
@maсhines = 10

def luck?
  rand(0..1) == 1
end

def boom
  diff = rand(1..5)
  if luck?
    @maсhines -= diff
    puts "#{diff} машин уничтожено"
  else
    @humans -= diff
    puts "#{diff} людей погибло"
  end
end

def random_city
  dice = rand(1..5)
  if dice == 1
    "Москва"
  elsif dice == 2
    "Лос-Анджелес"
  elsif dice == 3
    "Пекин"
  elsif dice == 4
    "Лондон"
  else
    "Сеул"
  end
end

def random_sleep
  sleep rand(0.3..1.5)
end

def stats
  puts "Осталось #{@humans.negative? ? 0 : @humans} людей и #{@maсhines.negative? ? 0 : @maсhines} машин"
end

def event1
  # Событие 1
  puts "Запущена ракета по городу #{random_city}"
  random_sleep
  boom
end

def event2
  # Событие 2
  puts "Применено радиоактивное оружие в городе #{random_city}"
  random_sleep
  boom
end

def event3
  # Событие 3
  puts "Группа солдат прорывает оборону противника в городе #{random_city}"
  random_sleep
  boom
end

def check_victory?
  if @humans <= 0
    puts "Победили машины в количестве #{@maсhines}"
    true
  elsif @maсhines <= 0
    puts "Победили люди в количестве #{@humans}"
    true
  end
end

loop do
  exit if check_victory?

  # Будем подбрасывать игральную кость, которая будет принимать значения от 1 до 3
  dice = rand(1..3)

  case dice
  when 1
    event1
  when 2
    event2
  when 3
    event3
  end

  stats
  random_sleep
end
