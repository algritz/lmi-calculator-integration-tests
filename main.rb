# frozen_string_literal: true

# Starting point of the testing framework
# Normally, I'd build a WEB-UI to allow users
# to select which test case they intend to run
# I'd also give then a link to the html report
# for the results of the test they just ran.

require 'psych'

def ask_for_action
  puts 'Log Me In Calculator test'
  puts 'Please select your test type (enter the corresponding number)'
  puts '[1]- Operational'
  puts '[2]- Functionnal'
  puts '[3]- All'
  gets.strip
end


def recreate_default_config
  File.delete('config/prefs.yml') if File.exist?('config/prefs.yml')
  newPrefFile = File.new('config/prefs.yml', 'w+')
  newPrefFile.puts('#either chrome or firefox, #default is chrome
browser: chrome

#[1]- Operational
#[2]- Functionnal
#[3]- All
tests_to_run: 3')
  newPrefFile.close
end


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
  end
end



read_config
input = @config.empty? ? ask_for_action : @config['tests_to_run']

case input

when '1'
  puts 'Running Operational tests'
  system 'rspec specs/operational.rb --format h > results/operational.html'
  puts 'Operational tests Completed'
when '2'
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
  get_action
end
