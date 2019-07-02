require 'sinatra'
require 'sinatra/reloader'

RANDOM_NUMBER = rand(100)
message = ''
color = 'blue'

def check_answer(guess)
  if guess > RANDOM_NUMBER + 5
    'WAY too high.'
  elsif guess < RANDOM_NUMBER - 5
    'Way too low'
  elsif guess > RANDOM_NUMBER
    'Too high.'
  elsif guess < RANDOM_NUMBER
    'Too low.'
  else
    "You got it right, the secret number was #{RANDOM_NUMBER}"
  end
end

get '/' do
  guess = params['guess'].to_i
  message = check_answer(guess)
  # throw params.inspect
  erb :index, locals: { number: RANDOM_NUMBER, message: message, color: color }
end
