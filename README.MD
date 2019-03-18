# PHONE NUMBER TO STRING CONVERTOR


Phone number to string convertor converts a 10 digit phone number to relewant word or combination of words. We can generate numbers like 1-800-motortruck which is easier to remember than 1-800-6686787825

The phone numbers will never contain a 0 or 1. 
Words have to be at least 3 characters.

Eg : 6686787825 returns a (long) list with at least these word combinations:

* motortruck
* motor, truck
* motor, usual
* noun, struck
* not, opt, puck


### Requirements

You will need:

* Ruby 2.2.0 or up


### Algorithm Design 

We use BFS approach to to find to get the required combinations of string from the input 10 digit number.
The dictionary of strings is maintained using a Trie data structure.
Once we generate the first 3 digit combination, we check if a word can be formed from the dictionary using string. The Trie class has a method check_tree and is used here. If not the string combination is excluded.

Finally all words are checked for possible combination and result is populated as array. Though this method created one more iteration , it reduce the code complexity and time target of 1000ms for conversion could be achived through this method.


### How to run 
Navigate to root directory of the repo

Step1: irb
Step2: load "number_convert.rb"
Step3: convertor = NumberConvert.new
Step4: convertor.convert(6686787825)

##Testing

Rspec helper is included with sample test data (spec/sample_output.json)


