class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    
    if numbers.start_with?('//')
      delimiter_line, numbers_line = numbers.split("\n", 2) # split exactly into two portions.
      delimiter = delimiter_line[2] # 3rd character is the actual delimiter
      numbers_line.split(delimiter).map(&:to_i).sum # splitting by delimiter & find sum
      nums = numbers_line.split(delimiter).map(&:to_i)
    else
      nums = numbers.split(/[,\n]/).map(&:to_i)
    end
    
    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?
    
    nums.sum
  end
end