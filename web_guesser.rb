require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER,
                          :message => message}
end

def check_guess(guess)
  guess = guess.to_i
  if guess > (SECRET_NUMBER + 5)
    message = "WAY too high!"
  elsif guess < (SECRET_NUMBER - 5)
    message = "WAY too low!!"
  elsif guess > SECRET_NUMBER
    message = "Too High!"
  elsif guess < SECRET_NUMBER
    message = "Too Low!"
  else
    "The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end
