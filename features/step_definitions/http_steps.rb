## Uses service as parameter
Given(/^I send a POST request to "([^"]*)" in "([^"]*)"$/) do |api_path, service, table|
  # url = File.join(ServiceDiscovery.url_for(service.to_sym), api_path)
  url = File.join("http://localhost:5000", api_path)
  @response = Faraday.post(url, table.hashes.first)
end

Given(/^I send a GET request to "([^"]*)" in "([^"]*)"$/) do |api_path, service|
  path = replace_path_parts(api_path)

  url = File.join(ServiceDiscovery.url_for(service.to_sym), path)
  @response = Faraday.get(url)
end

def replace_path_parts(path)
  if path.index(":book_id")
    path.gsub! ":book_id", @book["book_id"]
  end
  if path.index(":book_slug")
    path.gsub! ":book_slug", @book["slug"]
  end
  path
end
