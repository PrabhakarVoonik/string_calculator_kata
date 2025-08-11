require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for empty string' do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end

    it 'returns the number itself when given single number' do
      calculator = StringCalculator.new
      expect(calculator.add("1")).to eq(1)
    end

    it '# returns sum of two comma-separated numbers' do
      calculator = StringCalculator.new
      expect(calculator.add("1,5")).to eq(6)
    end

    it 'handles multiple numbers' do
      calculator = StringCalculator.new
      expect(calculator.add("1,2,3,4,5")).to eq(15)
    end

    it 'handles newlines between numbers' do
      calculator = StringCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiters' do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'throws exception for negative numbers' do
      calculator = StringCalculator.new
      expect { calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed -2")
    end

    it 'shows all negative numbers in exception message' do
      calculator = StringCalculator.new
      expect { calculator.add("1,-2,-3,4") }.to raise_error("negative numbers not allowed -2,-3")
    end

    it 'ignores numbers bigger than 1000' do
      calculator = StringCalculator.new
      expect(calculator.add("2,1001")).to eq(2)
    end

    it 'includes numbers equal to 1000' do
      calculator = StringCalculator.new
      expect(calculator.add("2,1000")).to eq(1002)
    end

    it 'supports multi-character delimiters' do
      calculator = StringCalculator.new
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'still supports single character custom delimiters' do
      calculator = StringCalculator.new
      expect(calculator.add("//[;]\n1;2")).to eq(3)
    end

    it 'supports multiple delimiters' do
      calculator = StringCalculator.new
      expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'supports multiple multi-character delimiters' do
      calculator = StringCalculator.new
      expect(calculator.add("//[***][%%]\n1***2%%3")).to eq(6)
    end

    it 'supports mixed single and multi-character delimiters' do
      calculator = StringCalculator.new
      expect(calculator.add("//[*][%%][;]\n1*2%%3;4")).to eq(10)
    end
  end
end