# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "<h1>Dice Roll</h1>
    <body>
      <p><a href='/dice/2/6'>
        2d6
      </a></p>
      <p><a href='/dice/2/10'>
        2d10
      </a></p>
      <p><a href='/dice/1/20'>
        1d20
      </a></p>
      <p><a href='/dice/5/4'>
        5d4
      </a></p>
      
      


   </body>
   "
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first=rand(1..10)
  second=rand(1..10)
  sum=first+second
  result= "You rolled a #{first} and a #{second} for total of #{sum}."
  "<h1>2d10</h1>
   <p>#{result}</p>"
end

get("/dice/1/20") do
  num=rand(1..20)
  result= "You rolled a #{num}."
  "<h1>1d20</h1>
   <p>#{result}</p>"
end

get("/dice/5/4") do
  num1=rand(1..4)
  num2=rand(1..4)
  num3=rand(1..4)
  num4=rand(1..4)
  num5=rand(1..4)
  sum=num1+num2+num3+num4+num5
  result= "You rolled a #{num1}, a #{num2}, a #{num3}, a #{num4} and a #{num5} for total of #{sum}."
  "<h1>5d4</h1>
   <p>#{result}</p>"
end
