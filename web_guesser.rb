require 'sinatra'
require 'sinatra/reloader'

random_number = rand(100)
message = ''

def check_answer(guess, number)
  if guess > number  + 5
    'WAY too high.'
  elsif guess < number - 5
    'Way too low'
  elsif guess > number
    'Too high.'
  elsif guess < number
    'Too low.'
  else
    "You got it right, the secret number was #{number}"
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
  guesses = 5
end
get '/' do
  guess = params['guess'].to_i
  message = check_answer(guess, random_number)
  color = set_color(guess, random_number)
  # throw params.inspect
  erb :index, locals: { number: RANDOM_NUMBER, message: message, color: color }
end
