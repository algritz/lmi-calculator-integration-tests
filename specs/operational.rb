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

    describe 'Assessing Numeric keys functional' do

      it 'Pressing the "1" button should add the "1" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '1'))
        expect(@browser.input.value.include? '1').to be true
      end
      it 'Pressing the "2" button should add the "2" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '2'))
        expect(@browser.input.value.include? '2').to be true
      end
      it 'Pressing the "3" button should add the "3" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '3'))
        expect(@browser.input.value.include? '3').to be true
      end
      it 'Pressing the "4" button should add the "4" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '4'))
        expect(@browser.input.value.include? '4').to be true
      end
      it 'Pressing the "5" button should add the "5" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '5'))
        expect(@browser.input.value.include? '5').to be true
      end
      it 'Pressing the "6" button should add the "6" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '6'))
        expect(@browser.input.value.include? '6').to be true
      end
      it 'Pressing the "7" button should add the "7" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '7'))
        expect(@browser.input.value.include? '7').to be true
      end
      it 'Pressing the "8" button should add the "8" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '8'))
        expect(@browser.input.value.include? '8').to be true
      end
      it 'Pressing the "9" button should add the "9" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '9'))
        expect(@browser.input.value.include? '9').to be true
      end
      it 'Pressing the "0" button should add the "0" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '0'))
        expect(@browser.input.value.include? '0').to be true
      end

    end

    describe 'Assessing that Operation keys are functional' do

      it 'Pressing the "PLUS" button should add the "+" value to the expression field' do
        # This one was pesky, the + wouldn't be detected by WATIR for some reason
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        expect(@browser.input.value.include? '+').to be true
      end

      it 'Pressing the "MINUS" button should add the "-" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '-'))
        expect(@browser.input.value.include? '-').to be true
      end
      it 'Pressing the "MULT" button should add the "x" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: "×"))
        expect(@browser.input.value.include? "×").to be true
      end
      it 'Pressing the "DIV" button should add the "/" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '/'))
        expect(@browser.input.value.include? '/').to be true
      end
    end

    describe 'Assessing that DEL key is functional' do
      it 'Pressing the "DEL" button should remove the last character to the expression field' do
        flash_and_ensure_click(@browser.button(value: 'DEL'))
        expect(@browser.input.value.include? '/').to be false
      end
    end
    describe 'Assessing that EQ (=) key is functional' do

      it 'Pressing the "EQ" button should yield the value ERR to the output field' do
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text.include? 'ERR').to be true
      end
    end
  end
end
