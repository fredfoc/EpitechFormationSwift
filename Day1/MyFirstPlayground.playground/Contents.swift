import UIKit

var str = "Hello, playground" //comments here
var myInt = 10

var test = str + ".I am Fred"
print(test)

func myFunc() {
    print("I am a func")
}

myFunc()

var anotherTest: String = "I am a string."
print(anotherTest)
anotherTest += " I was changed"
print(anotherTest)

let stringConstant = "I am a constant."
print(stringConstant)
//stringConstant += "Someone tries to change me"

var testValue = 10
var copyValue = testValue // par copie
print("testValue: \(testValue)")
print(copyValue)
testValue += 10
print(testValue)
print(copyValue)

class MyClass {
    var name = "My Name"
    func printClass() {
        print("MyClass: \(name)")
    }
}

var maClass = MyClass()
maClass.printClass()
var anotherClass = maClass // par reference
anotherClass.printClass()
maClass.name = "New Name"
anotherClass.printClass()

struct MyStruct {
    var name = "My Name"
    func printClass() {
        print("MyStruct: \(name)")
    }
}

var monStruct = MyStruct()
monStruct.printClass()
var anotherStruct = monStruct // par copie
anotherStruct.printClass()
monStruct.name = "New name for struct"
anotherStruct.printClass()
monStruct.printClass()

var maVar: String? // optional
print(maVar)

var maVarNonOptional = "Fred"

//méthode 1 : pas terrible
if maVar != nil {
    maVarNonOptional += maVar! // force unwrapping
}


if let maVar = maVar {
    maVarNonOptional += maVar
}

print(maVar)






