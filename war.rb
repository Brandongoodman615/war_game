require_relative 'card'
require_relative 'deck'
require_relative 'player'



deck = Deck.new
deck.shuffle
#puts "Player 1's name? "
player_1 = Player.new("B", deck.deal)
#puts "Player 2's name? "
player_2 = Player.new("C", deck.deal)

p player_1.hand.count

turn = 0

until player_1.hand.count == 0 || player_2.hand.count == 0
  
  turn += 1
  puts "hit enter to take next turn"
  if gets == "\n"
    puts "\n"
    puts "Turn #{turn}"
    puts "\n"
    puts "P1 hand: #{player_1.hand.count}"
    puts "P2 hand: #{player_2.hand.count}"
    puts "\n"
    player_1_card = player_1.hand.shift
    player_2_card = player_2.hand.shift
    puts "P1 plays: #{player_1_card.output_card}"
    puts "P2 plays: #{player_2_card.output_card}" 
    puts "\n"

    if player_1_card.rank == player_2_card.rank
      player_1_war = player_1.hand.shift(4)
      player_2_war = player_2.hand.shift(4)
      puts "******** WAR ********"
      puts "\n"
      puts "P1 war: #{player_1_war.last.output_card}"
      puts "P2 war: #{player_2_war.last.output_card}"
      puts "\n"
      puts "******** WAR ********"
      puts "\n"
      if player_1_war.last.rank > player_2_war.last.rank
        winner_cards = (player_1_war << player_2_war).flatten!
        winner_cards.push(player_1_card)
        winner_cards.push(player_2_card)
        player_1.hand.push(*winner_cards)
      else
        winner_cards = (player_1_war << player_2_war).flatten!
        winner_cards.push(player_1_card)
        winner_cards.push(player_2_card)
        player_2.hand.push(*winner_cards)
      end
    elsif player_1_card.rank > player_2_card.rank
      player_1.hand.push(player_1_card)
      player_1.hand.push(player_2_card)
    else
      player_2.hand.push(player_1_card)
      player_2.hand.push(player_2_card)
    end

  else
    break
  end
end

if player_1.hand.count > player_2.hand.count
  puts "-------------------------"
  puts "----Player 1 WINS!!!!----"
  puts "-------------------------"
else player_2.hand.count > player_1.hand.count
  puts "-------------------------"
  puts "----Player 2 WINS!!!!----"
  puts "-------------------------"
end