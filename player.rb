class Player
  attr_accessor :name, :hand

  def initialize(name, hand)
    @name = name
    @hand = hand
  end

  def show_hand
    @hand.each do |h|
      h.output_card
    end
  end

end 