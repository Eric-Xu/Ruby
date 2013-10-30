# Description

I used TDD to create two classes: `Book` and `Library`. The `Book` object stores a title, author, and category. The `Library` object stores a list of books, saves them to a YAML file, and allows them to be fetched by their category.

# Dependencies

  + [RSpec](http://rubygems.org/gems/rspec)
  + [Fuubar](http://rubygems.org/gems/fuubar)

# Test

To run all the tests:

```
bundle install
rspec spec
```