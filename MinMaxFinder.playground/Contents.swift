import UIKit

///function which takes array of numbers and return minimum and maximum numbers and prints it

func findMinMax(array: [Int]) -> (min: Int, max: Int) {
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let arrayOfNumbers = findMinMax(array: [20, 40, 55, 99, 1])

print("Minimum number is \(arrayOfNumbers.min) and Maximum number is \(arrayOfNumbers.max)")

