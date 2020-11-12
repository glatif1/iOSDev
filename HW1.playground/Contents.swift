import UIKit

var str = "Hello, playground"

func fib(num: Int) -> (Int){
    if(num == 0){
        return num
    }
    if (num == 1){
        return num
    }
    return fib(num: num-1) + fib(num: num-2)
}

func fibGen(num: Int) {
    for i in 1...num{
        print(fib(num: i))
    }
}
print("\nFibonacci Numbers")
fibGen(num: 10)

func isPrime(num: Int) -> (Bool) {
    var count = 0
    for n in 1...num{
        if(num%n == 0){
            count = count + 1
        }
    }
    
    if(count > 2){
        return false
    }else{
        return true
    }
}

print("\nisPrime")
print(isPrime(num: 31))

func fact(num: Int) -> (Int){
    if(num == 0){
        return 1
    }
    return  num * fact(num: num-1)
}

print("\nFactorial")
print(fact(num: 5))
