require 'sinatra'
require 'sinatra/reloader'

@@random_number = rand(100)
message = ''
@@guesses = 5

def check_answer(guess, number)
  @@guesses -= 1 unless guess == number
  return "You got it right, the secret number was #{number}" if guess == number
  if guess > number  + 5
    'WAY too high.'
  elsif guess < number - 5
    'Way too low'
  elsif guess > number
    'Too high.'
  elsif guess < number
    'Too low.'
  else
    'Error'
  end
end

def set_color(guess, number)
  if guess > number + 5
    'red'
  elsif guess < number - 5
    'red'
  elsif guess > number
    'yellow'
  elsif guess < number
    'yellow'
  else
  'green'
  end
end

def reset
  @@guesses = 5
  @@random_number = rand(100)
end

get '/' do
  guess = params['guess'].to_i
  message = check_answer(guess, @@random_number) if @@guesses.positive?
  message = 'New number generated, guesses reset!' && reset if @@guesses <= 0
  cheat_message = "The secret number is #{random_number}" if params['cheat']
  color = set_color(guess, @@random_number)
  # throw params.inspect
  erb :index, locals: { guesses: @@guesses, number: @@random_number, message: message, color: color, cheat_message: cheat_message }
end
