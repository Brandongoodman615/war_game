class Deck
  def initialize
    @suits = [:spades, :diamonds, :clubs, :hearts]
    @ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14]
    @cards = []
    @suits.each do |suit|
      @ranks.each do |rank|
        if suit == :diamonds || suit == :hearts
          color = :red
        else 
          color = :black
        end
        @cards << Card.new(rank, suit, color)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def show_hand(cards)
    cards.each do |c|
      c.output_card
    end
  end

  def deal 
    @top_26 = @cards.shift(26)
    @top_26
  end

  def deal_5
    @deal_5 = []
    until @deal_5.length == 5
      @deal_5 << @cards.shift
    end
    return @deal_5
  end

  def output 
    @cards.each do |card|
      card.output_card
    end
  end

  def count
    puts @cards.length
  end
end