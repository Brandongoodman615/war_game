class Card
  attr_accessor :rank, :suit, :color

  def initialize(rank, suit, color)
    @rank = rank
    @suit = suit
    @color = color
  end

  def rank_letter(rank)
    if rank == 14
      "A"
    elsif rank == 11
      "J"
    elsif rank == 12
      "Q"
    elsif rank == 13 
      "K"
    else
      rank = rank
    end
  end

  def suit_symbol(suit)
    if suit == :spades
      "\u2660"
    elsif suit == :diamonds
      "\u2666"
    elsif suit == :clubs
      "\u2663"
    else 
      "\u2665"
    end
  end

  def output_card
    "#{suit_symbol(@suit)} #{rank_letter(@rank)}"
  end
end


