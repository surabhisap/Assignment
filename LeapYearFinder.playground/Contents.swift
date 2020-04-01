import UIKit

/// determine if the given year is a leap year

let year = 2020
if year % 4 == 0 {
    if year % 100 == 0 && year % 400 != 0 {
        print("Not a leap year!")
    } else {
        print("Leap year!")
    }
} else {
    print(year, terminator: "-")
    print("Not a leap year!")
}

