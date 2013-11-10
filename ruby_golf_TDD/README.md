# Description

Ruby golf is the art of writing code that uses as few characters as possible. The idea originates in the world of Perl, where it is, unsurprisingly, known as [Perl Golf](http://en.wikipedia.org/wiki/Perl_Golf_Apocalypse).

### Hole 1: Fizz Buzz

Given a number the function returns "Fizz" if it is a multiple of 3, "Buzz" if it is a multiple of 5 and "FizzBuzz" if it is a multiple of 15. If the number is not a multiple of 3 or 5 then the number is returned as a string.

```ruby
fizzbuzz(3) => "Fizz"
fizzbuzz(10) => "Buzz"
fizzbuzz(45) => "FizzBuzz"
fizzbuzz(31) => "31"
```

### Hole 2: Caesar Cipher

```ruby
caeser("hello",3) => "khoor"
caeser("hello",-3) => "ebiil"
```

Implement a Caesar Shift Cipher

### Hole 3: Rock, Paper, Scissors

Write a simple "rps" method that plays this game, where the player enters their "move" as an argument to the method. If the player enters an invalid option then the result should be "lose". The computer should choose its move at random. The output gives the computer’s "move" and the result as a comma-separated string.

```ruby
rps("Rock") => "Rock,Draw"
rps("Paper") => "Rock,Win"
rps("Scissors") => "Rock,Lose"
```

### Hole 4: String Counter

Write a method that when given a string and substring, returns the number of times the substring occurs in that string (ignoring case).

```ruby
count("Anagram","a") => 3
count("CookieMonster loves cookie.","cookie") => 2
```

### Hole 5: Swingers

Write a function that replaces "putting your keys in a tin". The argument to the function is an array of arrays that contain two objects. The function returns a new array where the pairs of objects have been mixed up. An object should not end up with it's original "partner".

```ruby
swingers([["Homer","Marge"],["Micky","Minnie"],["Fred","Wilma"],["Peter","Lois"],["George","Judy"]])
=> [["Homer","Wilma"],["Micky","Lois"],["Fred","Judy"],["Peter","Marge"],["George","Minnie"]]
```

# Pro Tips

  + Mass Assignment:

        a, b = 1, 2

  + Create Arrays Using the Shortcut Notation %w:

        a = %w(a b c) => ["a", "b", "c"]

  + Use the Ternary Operator for Logic:

        a > 10 ? "too big" : "fine"

  + Use Chained Ternary Operators for More Complex Logic:

        a < 0 ? "no negatives" : (a > 10 ? "too big" : "fine")

  + Use Scientific Notation for Numbers:

        1e6 is shorter than 100000

  + Use Dash-Rocket Syntax for Procs in Ruby 1.9+:

        sayhello = -> {p "hello"}
        sayhello = -> name {p "hello #{name}"}

  + For 1 Character Strings in Ruby 1.9+ Use:

        ?x => "x"

  + Learn Regular Expressions

  + Use Modulo to Test if a Number is a Factor:

        12 % 3 < 1 => true

  + Use Map to Iterate:

        %w(a b c).map{|x| puts x}

  + Use Symbol to Proc:

        %w(a b c).map(&:upcase) => ["A", "B", "C"]

  + Easy Joins:

        %w(a b c)*- is the same as %w(a b c).join"-"
        => "a-b-c"

  + Reuse Loops:

    A good way to avoid using 2 loops for different object types is to bung all the objects into a single array and use just one iterator, but then perform different tasks depending on the object type.

        ["a", "b", 2, 4].map {|e| e.to_s==e ? e.upcase : e*2}
        => ["A", "B", 4, 8]

# Dependencies

  + [minitest-colorize](http://rubygems.org/gems/minitest-colorize)

# Test

Unit tests are written using the MiniTest::Spec testing framework packaged with Ruby 1.9+. To run all the tests:

    ruby rg_test.rb --verbose