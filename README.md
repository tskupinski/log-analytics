# README

# Log-analytics - weblog parser and simple analytics provider

## Technology

| Name |  Version |
| :--: | :---: |
| [Ruby](https://www.ruby-lang.org) | 2.7.0 |

## How to use

To analyse data in your log file run the `parser.rb` file providing file as a first argument using `ruby` interpreter e.g:
(you need to be in the main directory of the application)
`ruby parser.rb webserver.log`

## Setup

#### Install gems

    $ bundle install

## Running tests

This implementation is using `RSpec` for tests you can use `rspec` command while in the main directory to run test suit.

### Notes from development:

- As I was the only developer I committed directly to the `master` branch. While working in a team with code review
  I would probably use feature-branch workflow
- Currently, there are no validations. Neither for the file itself nor single line. I wanted to use `IPPAddr` from `Ruby`
  standard library to validate IP addresses but it would fail on all entries in provided fixture file (sample IPs are not real IPs). 
  The next step for me would be to introduce those validations in the `LogParser` class.
- I decided to introduce `Analytics` class as a way to remove some of the logic from the `LogParser`. It serves as 
  an entry point to the application and is responsible for using dependencies to deliver results. I wanted to have this 
  layer to gain flexibility if e.g. someone would like to have different printing output or would like to parse a different
  kind of file to get data. Another benefit is that it allowed to better test method responsible for creating/finding page.
