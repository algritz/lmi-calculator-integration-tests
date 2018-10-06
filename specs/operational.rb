# frozen_string_literal: true

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
      it 'Pressing "1" should add the "1" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '1'))
        expect(@browser.input.value.include?('1')).to be true
      end
      it 'Pressing "2" should add the "2" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '2'))
        expect(@browser.input.value.include?('2')).to be true
      end
      it 'Pressing "3" should add the "3" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '3'))
        expect(@browser.input.value.include?('3')).to be true
      end
      it 'Pressing "4" should add the "4" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '4'))
        expect(@browser.input.value.include?('4')).to be true
      end
      it 'Pressing "5" should add the "5" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '5'))
        expect(@browser.input.value.include?('5')).to be true
      end
      it 'Pressing "6" should add the "6" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '6'))
        expect(@browser.input.value.include?('6')).to be true
      end
      it 'Pressing "7" should add the "7" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '7'))
        expect(@browser.input.value.include?('7')).to be true
      end
      it 'Pressing "8" should add the "8" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '8'))
        expect(@browser.input.value.include?('8')).to be true
      end
      it 'Pressing "9" should add the "9" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '9'))
        expect(@browser.input.value.include?('9')).to be true
      end
      it 'Pressing "0" should add the "0" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '0'))
        expect(@browser.input.value.include?('0')).to be true
      end
    end

    describe 'Assessing that Operation keys are functional' do
      it 'Pressing "PLUS" should add the "+" value to the expression field' do
        # This one was pesky, the + wouldn't be detected by WATIR for some reason
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        expect(@browser.input.value.include?('+')).to be true
      end

      it 'Pressing "MINUS" should add the "-" value to the expression field' do
        flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
        expect(@browser.input.value.include?('-')).to be true
      end
      it 'Pressing "MULT" should add the "x" value to the expression field' do
        flash_and_ensure_click(@browser.button(text: 'MULT', class: 'operation'))
        expect(@browser.input.value.include?('×')).to be true
      end
      it 'Pressing "DIV" should add the "/" value to the expression field' do
        flash_and_ensure_click(@browser.button(value: '/'))
        expect(@browser.input.value.include?('/')).to be true
      end
    end

    describe 'Assessing that DEL key is functional' do
      it 'Press "DEL" should remove the last char to the expression field' do
        flash_and_ensure_click(@browser.button(value: 'DEL'))
        expect(@browser.input.value.include?('/')).to be false
      end
    end
    describe 'Assessing that EQ (=) key is functional' do
      it 'Pressing "EQ" should yield the value ERR to the output field' do
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text.include?('ERR')).to be true
      end
    end
  end
end
