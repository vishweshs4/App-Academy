require_relative 'piece'

class King < Piece 
  attr_reader :val

  def initialize
    @val = " K ".yellow.bold
  end
end