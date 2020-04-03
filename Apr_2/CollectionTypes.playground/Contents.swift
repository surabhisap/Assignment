import UIKit

// Array

///Initializing empty array

var name = [String]()
print("The name of the trainee is \("Surabhi")")


///Array with an Array Literal

var bookList: [String] = ["Math", "Phycis"]

///Swift’s type inference
var books = ["Math", "Phycis"]

/// append new element
books.append("Data Structure")

books.insert("Design Patterns", at: 0)
///adding  more items using assignment operator
books += ["Algorithm", "Agile"]

books.count
///accessing array's element
books.first
books.last

var firstItem = books[0]
books[1] = "Chemistry"
print(books)

/// remove items from list
books.remove(at: 1)
books.removeLast()
books.removeFirst()
books.removeAll()


//Dictionary
var namesOfStates = [String: String]()
var states = ["PA": "Pennsylvania", "CT": "Connecticut", "OH": "Ohio"]

/// dictionary properties

if states.isEmpty {
    print("There is no State in the list")
}
else {
    print("List of stste is not empty")
}

///subscript syntax
states["NY"] = "NewYork City"

/// use subscript syntax to change the value associated with a particular key
states["NY"] = "NewYork"

///remove property
states.removeValue(forKey: "NY")

///Iterating Over a Dictionary

for(stateCode, stateName) in states {
    print("\(stateCode): \(stateName)")
}

///iterable collection of a dictionary’s keys or values by accessing its keys and values properties:
for stateCode in states.keys {
    print("State code: \(stateCode)")
}

for stateName in states.values {
    print("State name: \(stateName)")
}

/// taking array of keys and values seperately

let stateCode = [String](states.keys)
let stateName = [String](states.values)


//Task: Create an array with cities and group the values of array based on first Alphabet

var cities = ["Pittsburgh", "Columbus", "Hartford", "Chicago", "Boston", "Las Vegas", "Atlantic City", "Acadia", "Mount washington", "Washington DC", "Newyork City", "San Francisco", "New Jersey", "Harrisburgh", "State College", "Miami", "Key West", "Niagara Falls", "Flagstaff", "Philadelphia", "New Heaven", "Poconos", "Provincetown", "Wilmington","Millford"]


let sortedArray = Dictionary(grouping: cities, by: { $0.first!})
print(sortedArray)

func sortedArray(cities: [String]) -> Dictionary<Character, [String]> {

    let sortedArray = Dictionary(grouping: cities, by: { $0.first!})
    return sortedArray
}

print(sortedArray(cities: cities))

// Set
//4)    Create a Set of Odd numbers and even numbers and prime numbers perform below operations
//
//•    Union with odds and evens – print result in Ascending order
//•    Intersection with odds and evens – print result in Ascending order
//•    Subtraction with Odds and primes – print result in Ascending order

let setOdd: Set = [1,3,5,7,9]
let setEven: Set = [2,4,6,8,10]
let setPrime: Set = [1,3,5,7,11]

let oddEvenUnion = setOdd.union(setEven)
let oddEvenIntersaction = setOdd.intersection(setEven)
let oddPrimeSubstraction = setOdd.subtracting(setPrime)

print(oddEvenUnion)
print(oddEvenIntersaction)
print(oddPrimeSubstraction)


