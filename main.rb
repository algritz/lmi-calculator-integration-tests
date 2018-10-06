# frozen_string_literal: true

# Starting point of the testing framework
# Normally, I'd build a WEB-UI to allow users
# to select which test case they intend to run
# I'd also give then a link to the html report
# for the results of the test they just ran.

require 'psych'

#promts user on what he wants to do in cas ethe preference file wasn't loaded properly
def ask_for_action
  puts 'Log Me In Calculator test'
  puts 'Please select your test type (enter the corresponding number)'
  puts '[1]- Operational'
  puts '[2]- Functionnal'
  puts '[3]- All'
  test_to_run = gets.strip
  recreate_default_config(test_to_run)
  read_config
  run_tests
end

# recreated a default configuration file
def recreate_default_config(test_to_run = 3)
  File.delete('config/prefs.yml') if File.exist?('config/prefs.yml')
  newPrefFile = File.new('config/prefs.yml', 'w+')
  newPrefFile.puts("#[1]- Operational
#[2]- Functionnal
#[3]- All
tests_to_run: #{test_to_run}")
  newPrefFile.close
end

# handler that loads the config file
def read_config
  @config = {}
  begin
    @config = Psych.load_file('config/prefs.yml')
    puts 'preferences loaded'
  rescue => e
    puts e
    puts e.backtrace
    puts 'An error occured while loading the preference file'
    puts 'User will be asked what to do'
    recreate_default_config
    read_config
  end
end

def run_tests
  case @config['tests_to_run']
  when 1
    puts 'Running Operational tests'
    system 'rspec specs/operational.rb --format h > results/operational.html'
    puts 'Operational tests Completed'
  when 2
    puts 'Running Functional tests'
    system 'rspec specs/functional.rb --format h > results/functional.html'
    puts 'Functional tests Completed'
  when 3
    puts 'Running Operational & Functional tests'
    system 'rspec specs/operational.rb --format h > results/operational.html'
    puts 'Operational tests Completed'
    system 'rspec specs/functional.rb --format h > results/functional.html'
    puts 'Functional tests Completed'
  else
    puts 'Invalid Selection'
    recreate_default_config if !@config.nil? # config file did not contain valid values
    ask_for_action
  end
end


# meat of the action
read_config

#checks if we have an existing config and run the corresponding action
ask_for_action if @config.nil?
run_tests