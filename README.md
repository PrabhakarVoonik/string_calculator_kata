# String Calculator TDD Kata

A Ruby implementation of the String Calculator kata following Test-Driven Development (TDD) principles.

## Features

**Core Functionality:**
- Empty strings return 0
- Single numbers return the number itself
- Multiple comma-separated numbers return their sum
- Newline delimiters supported (`\n`)
- Negative number validation with detailed error messages

**Advanced Delimiter Support:**
- Single-character custom delimiters: `//;\n1;2` → 3
- Multi-character delimiters: `//[***]\n1***2***3` → 6
- Multiple delimiters: `//[*][%]\n1*2%3` → 6
- Multiple multi-character delimiters: `//[***][%%]\n1***2%%3` → 6
- Mixed delimiter lengths: `//[*][%%][;]\n1*2%%3;4` → 10

**Business Rules:**
- Numbers greater than 1000 are ignored
- Numbers equal to 1000 are included
- Negative numbers throw exceptions showing all negative values

## Installation

1. Clone or download this repository
2. Navigate to the project directory:
   ```bash
   cd string_calculator_kata
   ```
3. Install dependencies:
   ```bash
   bundle install
   ```

## Usage

### Interactive Ruby Console (IRB)

```bash
irb -r ./lib/string_calculator.rb
```

Then in the console:
```ruby
calculator = StringCalculator.new

# Basic usage
calculator.add("")                    # => 0
calculator.add("1")                   # => 1
calculator.add("1,2")                 # => 3
calculator.add("1,2,3,4,5")          # => 15

# Newlines as delimiters
calculator.add("1\n2,3")             # => 6

# Custom single-character delimiter
calculator.add("//;\n1;2")           # => 3

# Multi-character delimiter
calculator.add("//[***]\n1***2***3") # => 6

# Multiple delimiters
calculator.add("//[*][%]\n1*2%3")    # => 6

# Mixed delimiter lengths
calculator.add("//[*][%%][;]\n1*2%%3;4") # => 10

# Numbers > 1000 are ignored
calculator.add("2,1001")             # => 2

# Negative numbers throw exceptions
calculator.add("1,-2,3")             # => RuntimeError: negative numbers not allowed -2
```

## Running Tests

**Run all tests:**
```bash
bundle exec rspec
```

## Implementation Details

The String Calculator follows TDD principles:

1. **RED**: Write a failing test
2. **GREEN**: Write minimal code to pass
3. **REFACTOR**: Improve code structure

### Technologies Used:
- Ruby 2.6.10
- RSpec 3.13+ for testing
- Bundler for dependency management
