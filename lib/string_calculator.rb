class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    
    if numbers.start_with?('//')
      delimiter_line, numbers_line = numbers.split("\n", 2) # split exactly into two portions.
      if delimiter_line.start_with?('//[') && delimiter_line.end_with?(']') # check for multi char delimiter
        delimiters = delimiter_line.scan(/\[([^\]]+)\]/).flatten # capturing delimiters inside [] 
        normalized_string = numbers_line
        delimiters.each { |delim| normalized_string = normalized_string.gsub(delim, ',') }
        nums = normalized_string.split(',').map(&:to_i)
      else
        delimiter = delimiter_line[2]
        nums = numbers_line.split(delimiter).map(&:to_i) # splitting by delimiter & changing to integer
      end
    else
      nums = numbers.split(/[,\n]/).map(&:to_i)
    end
    
    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?
    
    nums.select { |n| n <= 1000 }.sum
  end
end