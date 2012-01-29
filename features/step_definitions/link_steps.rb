Then /^I should see the "([^"]*)" link$/ do |text|
  if page.respond_to? :should
    page.should(have_css("a", text: text),
                "Expected to see the #{text.inspect} link, but did not.")
  else
    assert page.has_content?(have_css("a", text: text))
  end
end

Then /^I should not see the "([^"]*)" link$/ do |text|
  if page.respond_to?(:should_not)
    page.should_not(have_css("a", text: text),
                    "Expected to not see the #{text.inspect} link, but did.")
  else
    assert page.has_no_content?(have_css("a", text: text))
  end
end
