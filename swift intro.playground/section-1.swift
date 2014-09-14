// Playground - noun: a place where people can play

var message : String = "Hello Batman"
let citizens : Int = 20;
//citizens = 56 will return error if citizens is a constant

var age : Int
age = 21
//age="old" returns error because age was declared as a type Int

var name = "Bruce"
//name = 40 returns error because swift inferred that the name was a string based on its initial value
name = "Alfred"

//firstName = Jason returns error because we are missing var

println("Who am I?")

println("\(name)")
//variables must be in quotes as well

println("\(name) is  \(age)")
println("\(name) \(age)")

let violet = ("#EE82EE", 238, 130, 238)
println("Violet is \(violet.0)")

let (hex, red, green, blue)=violet
println("Violet is \(hex)")

if age<22 {
    println("You're young")
}
else {
    println("you're not so young")
}

switch age {
case 0...5: println("you're a youngin'")
case 6...21: println("Don't do drugs")
default: println("Welcome to the real world")
}

for count in 1...age{
    println("\(count)")
}

var score : Int?
println("Score is \(score)")
score = 80
if score != nil {
    println("the score is \(score!)")
}

//no ! will result in Optional(80) being displayed instead of 80

let newScore : Int! = 95 //already force unwrapped
println("My new score is \(newScore)")