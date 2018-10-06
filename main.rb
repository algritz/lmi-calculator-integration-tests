# frozen_string_literal: true

# Starting point of the testing framework
# Normally, I'd build a WEB-UI to allow users
# to select which test case they intend to run
# I'd also give then a link to the html report
# for the results of the test they just ran.

#
# frozen_string_literal: true

def ask_for_action
  puts 'Log Me In Calculator test'
  puts 'Please select your test type (enter the corresponding number)'
  puts '[1]- Operational'
  puts '[2]- Functionnal'
  gets.strip
end

input = ask_for_action

case input

when '1'
  puts 'Running Operational tests'
  system 'rspec specs/operational.rb --format h > results/operational.html'
  puts 'Operational tests Completed'
when '2'
  puts 'Running Functional tests'
  system 'rspec specs/functional.rb --format h > results/functional.html'
  puts 'Functional tests Completed'
else
  puts 'Invalid Selection'
  get_action
end
