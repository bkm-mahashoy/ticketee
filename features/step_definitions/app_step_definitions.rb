Then /^the email should contain (\d+) parts$/ do |num_parts|
  current_email.parts.size.should eql(num_parts.to_i)
end

Then /^there should be a part with content type "([^"]*)"$/ do |content_type|
  current_email.parts.detect do |part|
    part.content_type.include?(content_type)
  end.should_not be_nil
end
