Given(/^I create a dummy book$/) do
  url = File.join(ServiceDiscovery.url_for(:books), "/books")
  response = Faraday.post(url, dummy_book)
  assert 201, response.status
  @book = JSON.parse(response.body)
end

def dummy_book
  {
    title: 'Pete the Cat: New Title',
    price: 900,
    isbn: "1234567890123",
    description: 'Pete ..'
  }
end

Given(/^I create a dummy category$/) do
  url = File.join(ServiceDiscovery.url_for(:books), "/categories")
  response = Faraday.post(url, dummy_category)
  assert 201, response.status
end

def dummy_category
  {
    name: 'Pretty watches',
    description: 'Lorem ipsum prium watcheum'
  }
end
