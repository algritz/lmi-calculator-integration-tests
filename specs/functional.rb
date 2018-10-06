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
    #empty_equation_field(@browser.div(id: 'output'), flash_and_ensure_click(@browser.button(value: 'DEL')))

    @browser.close
    @browser = nil
    # why closing the browser each time?
    # The output field isn't cleared by repeatedly pressing the DEL button via the automation
    # It does work manually, but Watir see the field empty after the first 'DEL press'
    # See for yourself, uncomment, the first line and comment the close and nil statements
  end

  describe 'Functional Testing' do
    describe 'validating the addition of 2 positive numbers' do
      it 'Adding 2 + 2 should yield 4' do
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text.include? '4').to be true
      end
    end
    describe 'validating the addition of 2 negative numbers' do
      it 'Adding -2 + -2 should yield -4' do
        flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text.include? '-4').to be true
      end
    end
    describe 'validating the addition of 1 postive number and negative number' do
      it 'Adding 2 + -2 should yield 0' do
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text.include? '0').to be true
      end
      it 'Adding -2 + 2 should yield 0' do
        flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text.include? '0').to be true
      end
    end
  end
end
