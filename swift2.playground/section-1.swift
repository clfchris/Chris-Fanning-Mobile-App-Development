// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func sayHello() {
    println("Hello class")
}

sayHello()

func sayHello(first: String, last: String){
    println("Hi \(first) \(last)")
    
}

sayHello("Bill", "Adams")

func sayWhat(firstName first: String, lastName last: String){
    println("What \(first) \(last)?")
}

sayWhat(firstName: "Bruce", lastName: "Wayne")

func sayWhy(firstName first: String, lastName last:String)->String{
    return "Why " + first + " " + last + "?"
}

sayWhy(firstName: "Tim", lastName: "Drake")

class Vehicle {
    var wheelNum = 4
    var speed = 75
    var mpg = 20
    let tankCapacity = 20
    var name : String?
    init(vehicleName vname: String){
        name = vname
    }
    init(){
        
    }
    func changeSpeed(amount: Int){
        speed = speed + amount
    }
}

let myCamaro = Vehicle()
myCamaro.mpg
myCamaro.speed
myCamaro.changeSpeed(10)
myCamaro.speed

class Counter {
    var count = 0
    func incrementBy(#amount: Int, num: Int){
        count+=amount * num //count=count +amount * num
    }
}
let myCounter = Counter()
myCounter.count
myCounter.incrementBy(amount: 10, num: 2)

myCounter.count

let myHybrid=Vehicle(vehicleName: "Prius")
myHybrid.name
if myHybrid.name != nil {
    myHybrid.name!
}

class Bicycle : Vehicle {
    var reflectors : Bool
    var riders = 1
    init(hasReflectors ref:Bool){
        reflectors = ref
        super.init()
    }
}

var bike = Bicycle(hasReflectors: false)
bike.wheelNum
bike.wheelNum=2
bike.wheelNum
bike.reflectors






















