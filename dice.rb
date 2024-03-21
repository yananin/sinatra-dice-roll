# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_six)
end

get("/dice/2/10") do
  first=rand(1..10)
  second=rand(1..10)
  sum=first+second
  @result= "You rolled a #{first} and a #{second} for total of #{sum}."
  erb(:two_ten)
end

get("/dice/1/20") do
  @num=rand(1..20)
  @result= "You rolled a #{@num}."
  erb(:one_twenty)
end

get("/dice/5/4") do
  num1=rand(1..4)
  num2=rand(1..4)
  num3=rand(1..4)
  num4=rand(1..4)
  num5=rand(1..4)
  sum=num1+num2+num3+num4+num5
  @result= "You rolled a #{num1}, a #{num2}, a #{num3}, a #{num4} and a #{num5} for total of #{sum}."
  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  erb(:one_hundred_six)
end
