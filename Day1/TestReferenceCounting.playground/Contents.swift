import Foundation

class MyClassA {
    var classB: MyClassB?
    deinit {
        print("ClassA was destroyed")
    }
}




class MyClassB {
    weak var classA: MyClassA?
    deinit {
        print("ClassB was destroyed")
    }
}

var myClassA: MyClassA? = MyClassA() // Refe. Counting = 1 +1
var myClassB: MyClassB? = MyClassB() // Refe. Counting = 1 //+1
myClassB?.classA = myClassA
myClassA?.classB = myClassB

myClassA = nil  // Refe. Counting = 1 -1
myClassB = nil  // Refe. Counting = 1 -1
