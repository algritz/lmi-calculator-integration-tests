def get_action
  puts 'Log Me In Calculator test'
  puts 'Please select your test type'
  puts '1- Operational'
  puts '2- Functionnal'
  gets.chomp!
end

input = get_action

case input

when "1"
  puts "Running Operational tests"
  system 'rspec specs/operational.rb --format h > results/operational.html'
  puts "Operational tests Completed"
when "2"
  puts "Running Fucntional tests"
  system 'rspec specs/functional.rb --format h > results/functional.html'
else
  puts 'Invalid Selection'
end





