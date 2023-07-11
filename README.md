# Beat Box
Beat Box is a project for Mod 1 of Turing designed to teach the creation and usage of linked lists. The end goal is to be able to provide a string of "beats", which will be converted into a linked list and "beat boxed" by the computer's text-to-speech reader.

## Iteration 1
### The Node class:
- A node holds some data
- A node can optionally hold a reference to another node

### The LinkedList class:
- LinkedList holds a head - a node representing the start of a list
- By virtue of nodes referencing nodes, the LinkedList can serve as a list of many nodes

LinkedList has a few methods available:
1. #append: appends one or more new nodes based on data provided as an argument
1. #count: returns the number of nodes in the list
1. #to_string: returns a string of concatenated data from each node in the list

## Iteration 2
### Additional Methods for LinkedList:
1. #insert: can insert a new node inside of the list at a given position
1. #prepend: can prepend a new node at the start of the list - making itself the new head
1. #find: returns a string of concatenated data from nodes in a given range and starting position
1. #includes?: returns a boolean indicating if a provided argument exists as data in any node in the list
1. #pop: removes and returns the final node from the list


## Iteration 3
### The BeatBox class:
- The BeatBox is essentially a "wrapper" around a LinkedList
- It stores a LinkedList, and is able to "play" the value of nodes in the list as if beatboxing

BeatBox methods:
1. #append: see LinkedList#append
1. #count: see LinkedList#count
1. #play: uses text-to-speech to "beatbox" the data of each node in the list


## Iteration 4
### Validation, Speed & Voice
- BeatBox#append can validate each data provided, and only create nodes for appropriate data. This is configurable with valid_beats.txt.

New methods are created to control the speed and voice of BeatBox#play:
1. #rate: sets the speed at which the list should be read through
1. #voice: sets the voice used to read through the list
1. #reset_rate: resets rate back to the default value (500)
1. #reset_voice: resets voice back to the default value ("Boing")

## Personal Challenge
### Create a runner file
- A runner file should exist to allow a user to beatbox
- User input should be required to determine voice, rate and beats
- Show the user the valid beats while prompting