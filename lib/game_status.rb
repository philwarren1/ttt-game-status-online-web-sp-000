# Helper Method
require 'pry'

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end  

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 
WIN_COMBINATIONS = [ 
[0,1,2], # top_row 
[3,4,5], # middle_row 
[6,7,8], # bottom_row 
[0,3,6], # left_column 
[1,4,7], # center_column 
[2,5,8], # right_column 
[0,4,8], # left_diagonal 
[6,4,2] # right_diagonal 
]

def won?(board)
 WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   
   position_1 = board[win_index_1] 
   position_2 = board[win_index_2] 
   position_3 = board[win_index_3]
   
   if 
     position_1 == "X" && position_2 == "X" &&
     position_3 == "X" 
     return win_combination
    elsif
     position_1 == "O" && position_2 == "O" &&
     position_3 == "O" 
     return win_combination
    end
  end
  return false
 end 
def full?(board)
   board.all? {|i| i == "X" || i == "O"}
end
def draw?(board)
   if !won?(board) && full?(board)
     return true
   elsif !won?(board) && !full?(board)
     return false
   else won?(board)
     return false
   end
end
def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
     elsif won?(board) && !full?(board)
       return true
    else 
     return false
   end 
end
def winner(board)
   if won?(board)
      return board[won?(board)[0]]
   end
end
