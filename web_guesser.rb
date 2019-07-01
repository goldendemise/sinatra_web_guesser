require 'sinatra'
require 'sinatra/reloader'

random_number = rand(100)
message = ''

def check_answer(guess)
  if guess > random_number + 5
    'WAY too high.'
  elsif guess < random_number - 5
    'Way too low'
  elsif guess > random_number
    'Too high.'
  elsif guess < random_number
    'Too low.'
  else
    "You got it right, the secret number was #{random_number}"
  end
end

get '/' do
  guess = params['guess'].to_i
  message = check_answer(guess)
  # throw params.inspect
  erb :index, locals: { number: random_number, message: message }
end
