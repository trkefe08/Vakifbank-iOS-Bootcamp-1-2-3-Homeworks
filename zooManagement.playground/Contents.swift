import UIKit
import Foundation

protocol ZooProtocol {
    func revenue(revenues: Int?)
    func expense(expenses: Int?)
    func addWater(waterLimit: Int?)
    func salaryPayment()
    func addAnimal(animals: String?, sound: String?)
    func addAnimalSitter(sitter: String?, animal: String?)
    func waterConsumption()
    func increaseWaterLimit(waterLimit: Int?)
}

struct Zoo {
    var budget: Int?
    var waterLimit = 10
    var water: Int?
    var audio: String?
    var animalSitter: String? {
        get {
            return animal
        }
        set {
            
        }
    }
    var animal: String?
}

class ZooManagement: ZooProtocol {
    var zoo = Zoo()
    
    func revenue(revenues: Int?) {
        var fakeBudget = zoo.budget ?? 0
        var fakeRevenue = revenues ?? 0
        var newBudget = fakeBudget + fakeRevenue
        zoo.budget = newBudget
        print("Hayvanat bahçesine \(revenues ?? 0) kadar gelir eklenmiştir.")
        print("Hayvanat bahçesinin yeni bütçesi \(newBudget) kadardır.")
    }
    
    func expense(expenses: Int?) {
        var fakeBudget = zoo.budget ?? 0
        var fakeRevenue = expenses ?? 0
        var newBudget = fakeBudget - fakeRevenue
        zoo.budget = newBudget
        print("Hayvanat bahçesinden \(expenses ?? 0) kadar masraf çıkarılmıştır.")
        print("Hayvanat bahçesinin yeni bütçesi \(newBudget) kadardır.")
    }
    
    func addWater(waterLimit: Int?) {
        var fakeWater = zoo.water ?? 0
        var fakeWaterLimit = waterLimit ?? 0
        var newWater = fakeWater + fakeWaterLimit
        zoo.water = newWater
        if zoo.water ?? 0 > zoo.waterLimit {
            zoo.water = zoo.waterLimit
            print("Günlük su limitinden fazla su ekleyemezsiniz. Güncel su durumu \(zoo.water ?? 0) kadardır. ")
        } else {
            zoo.water = newWater
            print("\(waterLimit ?? 0) kadar su eklenmiştir. Güncel su durumu \(zoo.water ?? 0) kadardır.")
        }
    }
    
    func increaseWaterLimit(waterLimit: Int?) {
        zoo.waterLimit += waterLimit ?? 0
        print("Su limiti \(waterLimit ?? 0) kadar arttırılmıştır. Güncel su limiti \(zoo.waterLimit) kadardır.")
    }
    
    func salaryPayment() {
        var sitter = zoo.animalSitter?.split(separator: " ").count ?? 0
        var newBudget = (zoo.budget ?? 0) - sitter * 2
        print("Bakıcıların maaşları \(sitter * 2) kadardır ve ödenmiştir")
        zoo.budget = newBudget
        print("Güncel bütçe durumu \(zoo.budget ?? 0) kadardır.")
    }
    
    func addAnimal(animals: String?, sound: String?) {
        var fakeAnimal = zoo.animal ?? ""
        var fakeAnimals = animals ?? ""
        print("Hayvanat bahçesine \(animals ?? "") eklenmiştir")
        var newAnimal = fakeAnimal + fakeAnimals
        zoo.animal = newAnimal + " "
        var fakeSound = zoo.audio ?? ""
        var fakeSounds = sound ?? ""
        var newSound = fakeSound + fakeSounds
        zoo.audio = newSound + " "
        print("Hayvanın çıkardığı ses \(sound ?? "") gibidir.")
        print("Hayvanat bahçesinin güncel durumu \(zoo.animal ?? "")şeklindedir.)")
        
    }
    
    func addAnimalSitter(sitter: String?, animal: String?) {
        var fakeSitter = zoo.animalSitter ?? ""
        var fakeSitters = sitter ?? ""
        print("Hayvanat bahçesine yeni bakıcı \(sitter ?? "") gelmiştir. ")
        print("Jack şu an için \(animal ?? "") bakıcılığı yapmaktadır")
        var newSitter = fakeSitter + fakeSitters
        zoo.animalSitter = newSitter + " "
        var animals = [String]()
        animals.append(zoo.animal ?? "")
    }
    
    func waterConsumption() {
        var animal = zoo.animal?.split(separator: " ").count ?? 0
        var newWater = (zoo.water ?? 0) - animal * 1
        print("Hayvanların günlük su tüketimleri karşılanmıştır. Güncel su durumu \(newWater) kadardır.")
        zoo.water = newWater
    }
    
    func extraCommand(completionBlock: () -> Void)  {
        print("Completion Block")
        completionBlock()
    }
}

let zooInstance = ZooManagement()
zooInstance.addAnimal(animals: "kedi", sound: "miyav")
zooInstance.addAnimal(animals: "inek", sound: "möö")
zooInstance.revenue(revenues: 20)
zooInstance.expense(expenses: 5)
zooInstance.addWater(waterLimit: 11)
zooInstance.waterConsumption()
zooInstance.addWater(waterLimit: 3)
zooInstance.increaseWaterLimit(waterLimit: 5)
zooInstance.addWater(waterLimit: 6)
zooInstance.addAnimalSitter(sitter: "Jack", animal: "kedi")
zooInstance.addAnimalSitter(sitter: "Harry", animal: "inek")
zooInstance.salaryPayment()
zooInstance.extraCommand {
    print("After the completion block")
}

