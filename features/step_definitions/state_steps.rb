Given /^there is a state called "([^"]*)"$/ do |name|
  State.create!(name: name)
end

When /^I follow the "([^"]*)" link for the "([^"]*)" state$/ do |link, name|
  state = State.find_by_name!(name)
  steps(%Q{When I follow the "#{link}" link within "#state_#{state.id}"})
end

Then /^I should not see the "([^"]*)" element$/ do |css|
  if page.respond_to? :should_not
    page.should_not(have_css(css),
                    "Expected to not see the #{css} element, but did.")
  else
    assert !page.have_css(css)
  end
end
