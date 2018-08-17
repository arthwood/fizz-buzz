# FizzBuzz

### CI status:
[![CircleCI](https://circleci.com/gh/arthwood/fizz-buzz/tree/master.svg?style=svg)](https://circleci.com/gh/arthwood/fizz-buzz/tree/master)

### Description

All the scenarios can be seen in `spec/app/fizz_buzz_spec.rb`.
FizzBuzz is a class that can be instantiated with two arguments:
* `configuration` which is a Hash that maps integer to word.
* `criteria` which is an Array of Lambdas. 
Every Lambda will be called with integer and `configuration` key.
If any of `criteria` (lambda) evaluates to true then the given word (`configuration` value) 
is returned for given integer.
