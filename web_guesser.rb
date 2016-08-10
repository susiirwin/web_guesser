require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER,
                          :message => message,
                          :color => @color}
end

def check_guess(guess)
  guess = guess.to_i
  if guess > (SECRET_NUMBER + 5)
    @color = "red"
    @message = "WAY too high!"
  elsif guess < (SECRET_NUMBER - 5)
    @color = "red"
    @message = "WAY too low!!"
  elsif guess > SECRET_NUMBER
    @color = "pink"
    @message = "Too High!"
  elsif guess < SECRET_NUMBER
    @color = "pink"
    @message = "Too Low!"
  else
    @color = "green"
    "The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end
