class Game
  def initialize
    @input = '0100110'
    @flag = true
    @errors = []
    @good_choice = []
    @best_choice = []
    @bad_choice = []
    @path = []

  end

  class << self
    attr_accessor :input
    attr_accessor :flag
    attr_accessor :errors
  end

  def error_check()
    @input.each_char.with_index do |character, index|
      if index > 1
        if (@input[index - 1].to_i + @input[index].to_i + @input[index + 1].to_i) == 0
          @flag = false
          @errors.push(index)
        end
      end
    end
    @errors.each_index do |index|
      puts "Error in index: #{@errors[index]}"
    end
  end

  def solution
    error_check
    i = 0
    @input.size.times do
      @input[i] = '.'
      i += 1
    end
    finished = @input
    while @flag
      error_check
      @best_choice.clear
      @good_choice.clear
      @bad_choice.clear
      @input.each_char.with_index do |character, index|
        if @flag == false
          puts "No solution2"
        else
          if character == '1'
            if (@input[index - 1].to_i + @input[index].to_i + @input[index + 1].to_i) == 1
              puts "Index: #{index} , char: #{character} goes to best "
              @best_choice.push(index)
            elsif (@input[index - 1].to_i + @input[index].to_i + @input[index + 1].to_i) == 2
              puts "Index: #{index} , char: #{character} goes to good "
              @good_choice.push(index)
            elsif (@input[index - 1].to_i + @input[index].to_i + @input[index + 1].to_i) == 3
              puts "Index: #{index} , char: #{character} goes to bad "
              @bad_choice.push(index)
            end
          end
        end
      end

      if @input = finished
        puts "Done!"
        break
      end

      if !@best_choice.empty?
        @input[@best_choice[0] - 1] = '1'
        @input[@best_choice[0]] = '.'
        @input[@best_choice[0] + 1] = '1'
        @path.push(@best_choice[0])

      elsif !@good_choice.empty?
        if @input[@good_choice[0] - 1] == '1'
          @input[@good_choice[0] - 1] = '0'
          @input[@good_choice[0]] = '.'
          @input[@good_choice[0] + 1] = '1'

        else
          @input[@good_choice[0] - 1] = '1'
          @input[@good_choice[0]] = '.'
          @input[@good_choice[0] + 1] = '0'
        end

        @path.push(@good_choice[0])

      else
        puts "No solution1"
      end


    end
  end
end


#Main

cards = Game.new

cards.solution



