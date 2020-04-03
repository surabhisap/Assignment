import UIKit


//5)    Create an Enumeration consists of DeviceTypes and Model
//) Display the Model of the Device
//2.Create a function which compares 2 devices and return the result

enum Device: String, Equatable {
    case deviceType = "Android"
    case model = "Samsung Note"
}

func getTheModelType(device: Device) -> String {
    return device.rawValue
}

print(getTheModelType(device: .model))

func compareDevices(device1: Device?, device2: Device?) -> Bool {
    if device1 == device2 {
        return true
    }
    return false
}

compareDevices(device1: Device(rawValue: "Android"), device2:  Device(rawValue: "Android"))


enum Days {
    case sun, mon, tus, wed, thu, fri, sat
}
///Func accept enum type  as a parm
func getTodaysStatus(day: Days) -> String? {
    if day == .sun {
        return "It's a cheat day, say No to gym"
    } else {
        return "Today is a beatiful day to workout "
    }
}

getTodaysStatus(day: .mon)

func getWeekStatus(day: Days) -> String {
    
    switch day {
    case .sun, .sat:
        return "weekend!"
    case .fri:
        return "Hurrayy, It's Friday!"
    default:
        return "It's a weekday, continue working!"
    }
}

getWeekStatus(day: .fri)


//Enums with additional values

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getWeatherStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

getWeatherStatus(weather: WeatherType.wind(speed: 5))


//CaseIterateable

enum ComputerType: CaseIterable {
    case mac, windowsLaptop, iMac
}

for computerType in ComputerType.allCases {
    print("My favorite compuer type is \(computerType).")
}

// two-cased enums in place of boolean

enum AnswerState {
    case right
    case wrong
}

var answerState: AnswerState
answerState = .right

enum ArticleFeedState {
    case newArticles
    case nothingNew
}

var articleState: ArticleFeedState
articleState = .newArticles


// Associated Values

enum Cargo {
    case size(Int, Int, Int)
    case goods(String)
}

var cargo = Cargo.size(20, 40, 60)
cargo = .goods("Electronics")


switch cargo {
case .size(let length, let width, let height):
    print("Size: \(length), \(width), \(height)")
case .goods(let materialName):
    print("Goods: \(materialName).")
}

//Raw Value
///Implicitly Assigned Raw Values

enum Car: Int {
    //Car.Ford has an explicit raw value of 1, Car.bmx has raw value 2 and so on
    case jaguar = 1, bmw, farari, porsche, ford, toyota
}

let carRanking = Car.bmw.rawValue
let leastRaningCar = Car(rawValue: 5)


//Swift can’t synthesize an allCases property if any enum cases are marked unavailable.
// to get allCases need to add manually
enum Direction: CaseIterable {
    static var allCases: [Direction] {
        return [.north, .south, .east, .west]
    }
    
    case north, south, east, west
    
    @available(*, unavailable)
    case all
}

// Use of fallthrough

enum Bank {
    case pnc
    case chase
    case bofa
}

let bankType = Bank.pnc

var description = "The \(bankType) bank has"

switch bankType {
case .bofa:
    description += " good bank, also has"
    fallthrough
default:
    description += " low interest rate."
}

print(description) // The image type gif is animatable, and also an image.
