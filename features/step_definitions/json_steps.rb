Then(/^the response status should be "([^"]*)"$/) do |code|
  assert_equal code.to_i, @response.status
end

Then(/^the JSON response should have (\d+) record$/) do |records|
  json = JSON.parse(@response.body)
  assert_equal records.to_i, json.size
end

Then(/^the JSON response at "([^"]*)" should be:$/) do |index, string|
  json = JSON.parse(@response.body)
  assert_equal JSON.parse(string), json[index.to_i]
end

Then(/^the JSON response should be:$/) do |string|
  json = JSON.parse(@response.body)
  assert_equal JSON.parse(string), json
end

Then(/^the JSON response should include "([^"]*)"$/) do |string|
  assert @response.body.include?(string)
end

Then(/^the response should be valid JSON$/) do
  assert JSON.parse(@response.body)
end
