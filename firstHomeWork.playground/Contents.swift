import Foundation



// 1. SORU CEVABI
func checkingPalindrome(_ palindrome: String) -> Bool {
    let palindrome = palindrome.lowercased().filter {
        $0 != " " && $0 != "." && $0 != "," && $0 != "-" && $0 != "'" && $0 != "?" && $0 != "!" && $0 != "_" && $0 != "/" && $0 != ":" && $0 != ";"
    }
    for (char, character) in palindrome.enumerated() {
        if character != Array(palindrome)[palindrome.count - char - 1] {
            return false
        }
    }
    return true
}
print(checkingPalindrome("taco';- :cat,taco.caT?!_/"))

// 2. SORU CEVABI
func numberOfEachElement() {
    let anyArray = ["Jack", "Brian", "Jack", "Jessie", 3, 3, 2, 2, 1, 1, 12.0, true, true] as [AnyHashable]
    let elementNumber = anyArray.reduce(into: [:]) { elementNumber, word in elementNumber[word, default: 0] += 1 }
    print(elementNumber)
}
numberOfEachElement()

// 3. SORU CEVABI

func rightPyramidFunction(myFloor: Int) {
    
    var counter: String = ""
    
    for floor in 0..<myFloor {
        for _ in 0...floor {
            counter.append("*")
        }
        print(counter)
        counter = ""
    }
}

rightPyramidFunction(myFloor: 5)

// 4. SORU CEVABI

func pyramidFunction(myFloor: Int) {
    
    var spaces: String = ""
    var stars: String = ""
    
    for floor in 0..<myFloor
    {
        for _ in stride(from: myFloor, to: floor, by: -1)
        {
            spaces.append(" ")
        }
        
        for _ in 0...floor
        {
            stars.append("* ")
        }
        print("\(spaces)\(stars)")
        
        spaces = ""
        stars = ""
    }
}
pyramidFunction(myFloor: 5)

// 5. SORUNUN 1. KISMI

func totalNumber() {
    var number = 0
    
    for total in 1..<1000 {
        if total % 3 == 0 || total % 5 == 0 {
            number += total
        }
    }
    print(number)
}
totalNumber()

// 5. SORUNUN 2. KISMI

func totalFibonacci(myFibonacci: Int) {
    var numberFirst = 0
    var numberSecond = 1
    var result = 0
    var totalNumber = 0
    
    while result < myFibonacci {
        result = numberFirst + numberSecond
        numberFirst = numberSecond
        numberSecond = result
        
        if result % 2 == 0 {
            totalNumber += result
        }
    }
    print("Total Number: \(totalNumber)")
}
totalFibonacci(myFibonacci: 4000000)

// 5. SORUNUN 3. KISMI

var primeFactor = 2

func largestPrimeFactor(number: Int) -> Int {
    
    if number <= 1 { return primeFactor }
    
    if number % primeFactor == 0 {
        return largestPrimeFactor(number: number / primeFactor)
    } else {
        primeFactor += 1
        return largestPrimeFactor(number: number)
    }
}
print("Largest Prime Factor:",largestPrimeFactor(number: 600851475143))

