#Main

input = '0101.00'
flag = true
errors = []

input.each_char.with_index do |character, index|
  if index > 1
    if (input[index - 2].to_i + input[index - 1].to_i + input[index].to_i) == 0
      flag = false
      errors.push(index - 1)
    end
  end
end

errors.each_index do |index|
  puts "Error in index: #{errors[index]}"
end








