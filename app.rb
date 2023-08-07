require_relative 'message_outputs'

class App
  include MessageOutputs

  def run
    greetings
    loop do
      number_choice = options
      option_selected(number_choice)
    end
  end

  def option_selected(number)
    case number
    # Complete the choices
    when 16
      goodbye
      exit
    else
      puts 'Invalid number: Please enter a valid number'
    end
  end
end
