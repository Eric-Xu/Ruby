# Description

This is a singly linked list written in Ruby. See [wikipedia](http://en.wikipedia.org/wiki/Linked_list#Singly_linked_list) for more information on the data structure.

The `Node` class is composed of a data and a reference to the next node in the sequence. The `List` class has head, tail, and count attributes, as well as the following methods:

  + `ptq` put on top of queue
  + `pbq` put on bottom of queue
  + `rtq` remove from top of queue
  + `each` list iteration
  + `prev_node` given a node, returns the referencing node
  + `delete` given a data, removes all matching nodes
  + `reverse` non-destructive reverse
  + `reverse!` destructive reverse

Before running any tests, make sure to `bundle install` and retrieve all the required gems.

# Dependencies

  + [RSpec](http://rubygems.org/gems/rspec)

# Test

The test files live in spec/. To run all the tests:

    rake
