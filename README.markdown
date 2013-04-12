LINQ in Objective-C
===================

I'm pretty sure this has been done before in various ways in other places; but the goal of this library is:

1. Type safety: provide strongly-typed versions of all (generic) LINQ functions
2. Comprehensiveness: exposing *full* LINQ functionality
3. Performance: use fast enumeration for speed and deferred execution to facilitate method chaining

To be clear: only the first goal is met so far. Type safety (inasmuch as it is possible in Objective-C without generics) is achieved via the use of many versions of the same code, auto-generated via Ruby templates. The other two remain goals for the future.

Installation
------------

This project requires CocoaPods. Be sure to run

    bundle install

to get that (and a few other gems) installed.

Then:

    rake populate
    pod install
    rake compile
