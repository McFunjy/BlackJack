# frozen_string_literal: true

class Interface
  CHOICES = {
    '1' => { label: 'Добавить карту', action: :take },
    '2' => { label: 'Открыть карты', action: :open },
    '3' => { label: 'Пропустить', action: :skip }
  }.freeze
  MENU = {
    '1' => { label: 'Продолжить игру', action: :continue },
    '0' => { label: 'Взять банк и покинуть казино', action: :exit }
  }.freeze

  def show_new_round(num_round)
    puts "============= Раунд №#{num_round} ============"
  end

  def show_hiden_field(player, dealer)
    puts "#{player.name}: #{player.show}  [#{player.score}]"
    puts "#{dealer.name}: #{'xx ' * dealer.hand.size}  [XX]"
  end

  def show_choices
    puts '----------------'
    puts 'Выберете действие'
    CHOICES.each { |num, choice| puts "#{num} - #{choice[:label]}" }
    puts '----------------'
  end

  def show_decision(choice, player)
    puts "Решение игрока #{player.name}: #{choice}"
  end

  def show_field(player, dealer)
    puts 'Вскрываемся!'
    puts "#{player.name}: #{player.show}  [#{player.score}]"
    puts "#{dealer.name}: #{dealer.show}  [#{dealer.score}]"
  end

  def show_draw
    puts '================'
    puts 'Результат: ничья'
    puts 'Ставки возвращены'
  end

  def show_winner(player)
    puts '================'
    puts "Победитель раунда: #{player.name}"
  end

  def show_remains(player, dealer)
    puts '============== Баланс =============='
    puts "#{player.name}: $#{player.bank}"
    puts "#{dealer.name}: $#{dealer.bank}"
  end

  def loser(player)
    puts "Игра окончена, игрок #{player.name} не может поставить минимальную ставку"
  end

  def show_continue
    MENU.each { |num, choice| puts "#{num} - #{choice[:label]}" }
  end

  def show_end(player)
    puts "Спасибо за игру, Ваш баланс: $#{player.bank}"
  end
end
