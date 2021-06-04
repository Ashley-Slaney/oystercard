# Oystercard
---

## Makers Week 2 Pairing Challenge
---

## Description
##### This oystercard challenge will allow you to top up money on to the card, touch in and out at different stations, show you your current balance and the all of the journeys that you've been on

## Task:
##### Build an Oystercard system using your skills in Ruby, TDD and object-oriented design.


## Challenge user stories: 

```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## How to use
* Download the code using `$ git clone`
* From inside the command line, type `$ irb` to open the Ruby REPL
* Use the following commands to interact with the program:
```
2.7.2 :001 > require './lib/oystercard.rb'
 => true 
2.7.2 :002 > card = Oystercard.new
 => #<Oystercard:0x00007fcd192055d8 @journeys=[], @balance=0> 
2.7.2 :003 > card.top_up(20)
 => 20 
2.7.2 :004 > card.balance
 => 20 
2.7.2 :005 > card.touch_in('Waterloo')
 => "Waterloo" 
2.7.2 :006 > card.touch_out('Euston')
 => "Euston" 
2.7.2 :007 > card.touch_in('Euston')
 => "Euston" 
2.7.2 :008 > card.in_journey?
 => true 
2.7.2 :009 > card.touch_out('London Bridge')
 => "London Bridge" 
2.7.2 :010 > card.journeys
 => [{:entry_station=>"Waterloo", :exit_station=>"Euston"}, {:entry_station=>"Euston", :exit_station=>"London Bridge"}] 
```

## Running the tests
* Within the root of the directory, run `$ rspec` to run the tests and see the results in the command line

## Dependencies
* Written in Ruby version 2.7.2
* Tests written in RSpec

## Approach
* Focused on implementing the TDD & OOP principle's during each challenge
* Understanding the use of doubles and implementing them into my tests
