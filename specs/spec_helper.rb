#over the years I've come to see that browsers would sometime:
# - try to click on things before they were rendered, or active (&:present?)
# - click on elements that are outside of the screen's viewport (scroll)
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
  dom_element.scroll.to
  dom_element.flash
  dom_element.click
end