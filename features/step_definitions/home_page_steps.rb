Given /^the following home_pages:$/ do |home_pages|
  HomePage.create!(home_pages.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) home_page$/ do |pos|
  visit home_pages_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following home_pages:$/ do |expected_home_pages_table|
  expected_home_pages_table.diff!(tableish('table tr', 'td,th'))
end
