class TicTacToe
  
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end
    
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
    
  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1 
  end
  
  def move(user_input, token="X")
    @board[user_input.to_i] = token
  end
  
  def position_taken?(user_input)
    @board[user_input] != " " && @board[user_input] != ""
  end
  
  def valid_move?(user_input)
    user_input.between?(0,8) && !position_taken?(user_input)
  end
  
  def turn_count
    counter = 0
   @board.each do |pos|
     if pos == "X" || pos == "O"
   counter += 1
   end
   end
   counter
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else 
      "O"
    end
  end
  
  def turn
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   if valid_move?(index)
     token = current_player
     move(index, token)
   else turn
  end
  display_board
  end
  
  def won?
    WIN_COMBINATIONS.each do |wincombo|
      if (@board[wincombo[0]]) == "X" && (@board[wincombo[1]]) == "X" && (@board[wincombo[2]]) == "X" 
      return wincombo
      elsif (@board[wincombo[0]]) == "O" && (@board[wincombo[1]]) == "O" && (@board[wincombo[2]]) == "O"
      return wincombo
    end
  end
  false
  end
  
  def full?
    if @board.none? " "
      true
    else
      false
    end
  end
  
  def draw? 
    if full? == true && won? == false
      true
    else
      false
    end
  end
  
  def over?
    if full? == true || won? != false || draw? == true
      true
    else
      false
  end
  end
  
   def winner
     win = won?
      if win 
        @board[win[0]]
    end
    end
    
  def play 
    until over?
    turn
  end
   if won? 
     puts "Congratulations #{winner}!"
   else puts "Cat's Game!"
   end
  end
  
  end