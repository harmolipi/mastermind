# Mastermind
Created as part of [The Odin Project](https://www.theodinproject.com) curriculum.

View on [Github](https://github.com/harmolipi/mastermind)

### Functionality

This is the [Mastermind](https://www.theodinproject.com/courses/ruby-programming/lessons/mastermind) project, which plays a simple game of Mastermind, allowing the player to be either the codemaker or codebreaker.

### Thoughts

This project was a good exercise in tackling complexity by abstracting with higher level methods.

The most difficult part was creating the logic for codemaker mode. Although it's easy to come across strong Mastermind strategies online, I found that they quickly become messy when I started trying to implement them. The hardest part was having information from previous guesses carry onto the next guess. The strategy I finally settled on involved a decently fast way of first narrowing it down to the 4 correct numbers, and then randomly shuffling them (and checking to make sure that it hasn't already tried that combination) in hopes of getting the solution.

God bless.

-Niko Birbilis