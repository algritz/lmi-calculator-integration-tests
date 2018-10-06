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
        it 'substracting (-2 - -2) should yield 0 (This test WILL FAIL)' do
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
    describe 'multiplications operations' do
      describe 'validating the multiplication of 2 positive numbers' do
        it 'multiplicating (2 x 2) should yield 2' do
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'MULT', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('4')
        end
      end
      describe 'validating the multiplication of 2 negative numbers' do
        it 'multiplicating (-2 x -2) should yield 2' do
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'MULT', class: 'operation'))
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('4')
        end
      end
      describe 'validating the multiplication of 1 possitive anb 1 negative number' do
        it 'multiplicating (1 x -2) should yield -2' do
          flash_and_ensure_click(@browser.button(value: '1'))
          flash_and_ensure_click(@browser.button(text: 'MULT', class: 'operation'))
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('-2')
        end
      end
    end

    describe 'divisions operations' do
      describe 'validating the division of 2 positive numbers' do
        it 'dividing (2 / 2) should yield 1' do
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'DIV', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('1')
        end
      end
      describe 'validating the division of 2 negative numbers' do
        it 'dividing (-2 / -2) should yield 1' do
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'DIV', class: 'operation'))
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('1')
        end
      end
      describe 'validating the division of 1 positive and 1 negative number' do
        it 'dividing (2 / -1) should yield -1' do
          flash_and_ensure_click(@browser.button(value: '2'))
          flash_and_ensure_click(@browser.button(text: 'DIV', class: 'operation'))
          flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
          flash_and_ensure_click(@browser.button(value: '1'))
          flash_and_ensure_click(@browser.button(value: 'EQ'))
          expect(@browser.div(id: 'output').text).to eq('-2')
        end
      end
=end
  end

  describe 'Edge cases' do
    describe 'validating the division by 0 of any numbers' do
      it 'dividing any number ny 0 should yield an ERR result' do
        # ok, some fluff here. I could have used any static number here, but hey, life's random at times. :-D
        flash_and_ensure_click(@browser.button(value: rand(1..9).to_i.to_s))
        flash_and_ensure_click(@browser.button(text: 'DIV', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '0'))
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text).to eq('Infinity')
      end
    end
    describe 'validating the division by a positive number of a negative' do
      it 'dividing (2 by -2) should yield -1 result' do
        # ok, some fluff here. I could have used any static number here, but hey, life's random at times. :-D
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'DIV', class: 'operation'))
        flash_and_ensure_click(@browser.button(text: 'MINUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text).to eq('-1')
      end
    end
    describe 'validating the division zero by number of any numbers' do
      it 'dividing any number ny 0 should yield 0 as result' do
        # more random fluff
        flash_and_ensure_click(@browser.button(value: '0'))
        flash_and_ensure_click(@browser.button(text: 'DIV', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: rand(1..9).to_i.to_s))
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text).to eq('0')
      end
    end
    describe 'Respecting the order of operations' do
      it 'Should respect th order or operation implicating multiplications' do
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'MULT', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text).to eq('8')
      end

      it 'Should respect the order or operation implicating division' do
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'DIV', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text).to eq('5')
      end


      it 'l/f 1' do
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'MULT', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'PLUS', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(text: 'MULT', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '8'))
        flash_and_ensure_click(@browser.button(text: 'DIV', class: 'operation'))
        flash_and_ensure_click(@browser.button(value: '2'))
        flash_and_ensure_click(@browser.button(value: 'EQ'))
        expect(@browser.div(id: 'output').text).to eq('14')
      end

    end
  end
end
