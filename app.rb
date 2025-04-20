require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/payment/new") do
  erb(:payment)
end

get("/random/new") do
  erb(:random)
end
get("/square/new") do
   erb(:square)
end

get("/square/results") do
  @user_number = params["square"].to_f
  @result = @user_number*@user_number
  erb(:square_results)
end

get("/square_root/results") do
  @user_number = params["square_root"].to_f  # Convert the input to a Float
  @result = Math.sqrt(@user_number)
  erb(:squareroot_results)
end

get("/payment/results") do
  @apr = params["APR"].to_f
  @formatted_rate = @apr.to_fs(:percentage, { :precision => 4 })
  @years = params["Years"].to_f
  @principal = params["Principal"].to_f
  @rate = @apr/1200
  @n=-@years*12
  @numerator = @rate*@principal
  @denominator = 1 - ((1+@rate)**(@n))
  @payment = @numerator/@denominator
  erb(:payment_results)
end

get("/random/results") do
  @max=params.fetch("Maximum").to_f
  @min=params.fetch("Minimum").to_f
  @rand = rand(@min..@max)
  erb(:random_results)
end
