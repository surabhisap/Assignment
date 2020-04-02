// Date: Apr 1, 2020

import UIKit

// Control Flow Examples

let hourOfDay = 21
var timeOfDay: String

if hourOfDay < 6 {
  timeOfDay = "Early morning"
} else if hourOfDay < 12 {
  timeOfDay = "Morning"
} else if hourOfDay < 17 {
  timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
  timeOfDay = "Evening"
} else if hourOfDay < 24 {
  timeOfDay = "Late evening"
} else {
  timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)



let animal = "Lion"

if animal == "Bird" || animal == "Dog" || animal == "Cat" {
  print("Animal is a house pet.")
} else {
  print("Animal is not a house pet.")
}


var hoursWorked = 20

var price = 0
if hoursWorked > 20 {
  let hoursOver20 = hoursWorked - 20
  price += hoursOver20 * 50
  hoursWorked -= hoursOver20
}
price += hoursWorked * 25

print(price)



///Ternary Conditional Operator

let value1 = 9
let value2 = 15

let min: Int
if value1 < value2 {
  min = value1
} else {
  min = value2
}

let max: Int
if value1 > value2 {
  max = value1
} else {
  max = value2
}

let newMin = value1 < value2 ? value1 : value2
let newMax = value1 > value2 ? value1 : value2


//Loops

/// While loop

var title:String = ""
while title != "Ha" {
    title = title + "ha"
    print(title)
}

var x: Int = 10
repeat {
    print(x)
}
while(x < 10)

var sum = 3

while sum < 20 {
  sum = sum + (sum + 3)
}

/// repeat while loop

var initialValue = 1

repeat {
  initialValue = initialValue + (initialValue - 1)
}  while initialValue < 1000


///breaking out loop

var value = 1

while true {
  value = value + (value + 1)
  if value >= 20 {
    break
  }
}

///for loop

var count = 0

for row in 0..<15 {
  if row % 3 == 0 {
    continue
  }

  for column in 0..<15 {
    count += row * column
  }
}


var total = 0

rowLoop: for row in 0..<6 {
  columnLoop: for column in 0..<6 {
    if row == column {
      continue rowLoop
    }
    total += row * column
  }
}

let names = ["Surabhi", "Sia", "Ray"]
for name in names {
    print("Hello, \(name)!")
}

for i in stride(from: 0, to: 10, by: 1) {
    print(i)
}


///Switch Statement

let number = 5

switch number {
case 0:
    print("Mon")
case 1:
    print("Tus")
case 2:
    print("Wed")
case 3:
    print("Thu")
case 4:
    print("Fri")
case 5:
    print("Sat")
case 6:
    print("Sun")
default:
    print("day")
}


let totalNumber = 14

switch number {
case 3:
  print("Three")
default:
  break
}

let string = "Cat"

switch string {
case "Cat", "Dog", "bird":
  print("This is my pet.")
default:
  print("Not my pet")
}


let hours = 12
var time: String

switch hours {
case 0...5:
  timeOfDay = "Early morning"
case 6...11:
  timeOfDay = "Morning"
case 12...16:
  timeOfDay = "Afternoon"
case 17...19:
  timeOfDay = "Evening"
case 20...23:
  timeOfDay = "Late evening"
default:
  timeOfDay = "INVALID HOUR!"
}

print("time Of Day is /(time)")



let findNumberType = 7

switch findNumberType {
case let x where x % 2 == 0:
  print("Even number")
default:
  print("Odd number")
}

