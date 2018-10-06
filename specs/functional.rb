require 'watir'
require 'watir-scroll'
require 'rspec'

require_relative 'spec_helper'

describe 'Integration Tests' do
  before :each do
    @browser = Watir::Browser.new(:chrome)
    @browser.goto 'http://output.jsbin.com/hudape/1/'
  end

  after :each do
    #empty_equation_field(@browser.text_field(id: 'expression'), flash_and_ensure_click(@browser.button(value: 'DEL')))

    @browser.close
    @browser = nil
    # why closing the browser each time?
    # The output field isn't cleared by repeatedly pressing the DEL button via the automation
    # It does work manually, but Watir see the 'expression' field empty after the first 'DEL press'
    # See for yourself, uncomment, the first line and comment the close and nil statements
  end

  describe 'Functional Testing' do
=begin
    describe 'addition operations' do
      describe 'validating the addition of 2 positive numbers' do
        it 'Adding (2 + 2) should yield 4' do
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('4')
        end
      end
      describe 'validating the addition of 2 negative numbers' do
        it 'Adding (-2 + -2 )should yield -4' do
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('-4')
        end
      end
      describe 'validating the addition of 1 postive number and negative number' do
        it 'Adding (2 + -2) should yield 0' do
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('0')
        end
        it 'Adding (-2 + 2) should yield 0' do
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('0')
        end
      end
    end
    describe 'substration operations' do
      describe 'validating the substraction of 2 positive numbers' do
        it 'substracting (2 - 2) should yield 0' do
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('0')
        end
      end
      describe 'validating the substration of 2 negative numbers' do
        # this test WILL fail, as listed in the funtional issue list
        it 'substracting (-2 - -2) should yield 0' do
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('0')
        end
      end
      describe 'validating the substration of 1 negative and 1 positive number' do
        it 'substracting (-2 - 2) should yield -4' do
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '5'))
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('-7')
        end
      end
    end
=end
    describe 'multiplications operations' do
      describe 'validating the multiplication of 2 positive numbers' do
        it 'substracting (2 x 2) should yield 2' do
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'MULT', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('4')
        end
      end
      describe 'validating the multiplication of 2 negative numbers' do
        it 'substracting (-2 x -2) should yield 2' do
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'MULT', class: 'operation'))
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('4')
        end
      end
    end
  end
end
