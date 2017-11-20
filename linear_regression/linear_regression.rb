# This is a simple basic example of linear regression. Though not implemented in an IRuby notebook, it is to provide a 
basic layout of how your program could be
require 'csv'
require 'ruby_linear_regression'
x_data=[]
y_data=[]
CSV.foreach("./data/staten-island-single-family-home-sales-2015.csv", :headers => true) do |row|
x_data.push( [row[0].to_i, row[1].to_i] )
y_data.push( row[2].to_i )
end

# Create regression model
linear_regression = RubyLinearRegression.new
# Load training data
linear_regression.load_training_data(x_data, y_data)
# Train the model using the normal equation
linear_regression.train_normal_equation
prediction_data = [2000, 1500]
predicted_price = linear_regression.predict(prediction_data)
puts "Predicted selling price for a 1500 sq feet house on a 2000 sq feet property: #{predicted_price.round}$"
