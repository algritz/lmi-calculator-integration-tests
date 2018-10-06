# frozen_string_literal: true

# over the years I've come to see that browsers would sometime:
# - try to click on things before they were rendered, or active (&:present?)
#
#  The flash is there to help the QA / Developer follow along with the test flow,
# it also helps understanding what it was trying to achieve in case of a failure
#
# The click is, of course the intended action.
#
# I could probably have hijacked's Watir's click method with these but found
# that it would help really understanding what was going on in case of a failure
def flash_and_ensure_click(dom_element)
  dom_element.wait_until(&:present?)
  dom_element.flash
  dom_element.click
end

# Same as the flash_and_ensure_click, but with a scroll to element backed in
# - clicks on elements that are outside of the screen's viewport (scroll) tend to fail
# This methof is meant to prevent that
def flash_scroll_and_ensure_click(dom_element)
  dom_element.wait_until(&:present?)
  dom_element.scroll.to
  dom_element.flash
  dom_element.click
end

# this function was a "try" to clear the 'equation' field between each tests,
# unfortunately, Watir sees the equation field "empty" after the first "press"
# of the DEL button, which yields invalid scenarios afterwards.
# You can uncomment the call to this function in file functional.rb
# and see for yourself
def empty_equation_field(equation_dom_element, del_dom_element)
  if equation_dom_element.text.empty?
    puts equation_dom_element.text
  else
    flash_and_ensure_click(del_dom_element)
    empty_equation_field(equation_dom_element, del_dom_element)
  end
end
