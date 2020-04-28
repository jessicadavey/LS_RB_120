def joinor(arr, delimiter = ", ", conjunction = "or")
  if arr.size > 2
    arr.map.with_index { |x, i| i == arr.size - 1 ? "#{conjunction} #{x}" : x }
       .join(delimiter)
  elsif arr.size == 2
    "#{arr.first} #{conjunction} #{arr.last}"
  else
    arr.first.to_s
  end
end

p joinor([1, 2, 3, 4, 5, 6, 7, 8, 9])
p joinor([1, 2]) == "1 or 2"
p joinor([1, 2, 3]) == "1, 2, or 3"
p joinor([1, 2, 3], '; ') == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"
