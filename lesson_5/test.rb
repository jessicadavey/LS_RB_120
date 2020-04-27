squares = {1=>" ", 2=>"O", 3=>"X", 4=>" ", 5=>"O", 6=>" ", 7=>" ", 8=>"O", 9=>"O"}



WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
[[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
[[1, 5, 9], [3, 5, 7]]              # diagonals

def winning_marker(squares)
  WINNING_LINES.each do |line|
    marker = squares[line[0]]
    return marker if squares.values_at(*line).all?(marker) && marker != " "
  end
  nil
end

p winning_marker(squares)