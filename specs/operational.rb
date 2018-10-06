require 'watir'
require 'watir-scroll'
require 'rspec'

require_relative 'spec_helper'

describe 'Integration Tests' do
  before :all do
    @browser = Watir::Browser.new(:chrome)
  end
  describe 'Operational Testing' do
    describe 'Accessing the Calculator' do
      it 'Should open the web page of the calculator' do
        @browser.goto 'http://output.jsbin.com/hudape/1/'
      end
    end


  end
end
