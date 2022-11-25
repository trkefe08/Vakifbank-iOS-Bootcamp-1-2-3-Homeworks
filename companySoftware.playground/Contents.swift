import UIKit
import Foundation

protocol CompanyProtocol {
    func revenueManagement(revenue: Double)
    func expenseManagement(expense: Double)
    func addEmployee(name: String, age: String, status: String, type: String)
    func salaryPayment()
    func companyInfo()
}

class Company: CompanyProtocol {
    let companyName: String = "VakıfBank"
    let foundationYear: String = "1954"
    var revenues: Double?
    var expenses: Double?
    var budget: Double?
    var worker = [String]()
    var workerAge = [String]()
    var workerSeniority = [String]()
    var workerType: String?
    var names: String?
    var ages: String?
    var maritalStatus: String?
    
    func revenueManagement(revenue: Double) {
        var fakeBudget = budget ?? 0.0
        var fakeRevenue = revenue
        var newBudget = fakeBudget + fakeRevenue
        budget = newBudget
        print("Şirketimize \(revenue) kadar gelir eklenmiştir.")
        print("Şirketimizin yeni bütçesi \(newBudget) kadardır.")
    }
    
    func expenseManagement(expense: Double) {
        var fakeBudget = budget ?? 0.0
        var fakeExpense = expense
        var newBudget = fakeBudget - fakeExpense
        budget = newBudget
        print("Şirketimizden \(expense) kadar masraf çıkarılmıştır.")
        print("Şirketimizin yeni bütçesi \(newBudget) kadardır.")
    }
    
    func addEmployee(name: String, age: String, status: String, type: String) {
        print("Şirketimize \(name) adlı \(age) yaşında \(String(describing: status)), \(type) developer alınmıştır.")
        worker.append(name)
        worker.append(age)
        worker.append(status)
        worker.append(type)
        workerAge.append(age)
        workerSeniority.append(type)
        names = name
        ages = age
        maritalStatus = status
        workerType = type
        print(worker)
    }
    
    func salaryPayment() {
        var filteredAge = workerAge.filter({$0.count > 0})
        var filteredType = workerSeniority.filter({$0.count > 0})
        for age in filteredAge {
            for _ in filteredType {
                if filteredType.contains("Junior") {
                    budget! -= (Double(age) ?? 0.0) * 1.0
                } else if filteredType.contains("Middle") {
                    budget! -= (Double(age) ?? 0.0) * 2.0
                } else {
                    budget! -= (Double(age) ?? 0.0) * 3.0
                }
            }
        }
        print("Tüm maaş ödemeleri yapılmıştır. Şirketimizin güncel bütçesi \(budget!) kadardır")
        
    }
    
    func companyInfo() {
        print("Şirketin bilgileri aşağıdaki gibidir")
        print("Şirketin adı:", companyName)
        print("Şirketin kuruluş yılı:", foundationYear)
        print("Şirketin bütçesi: \(budget!) ")
        print("Çalışan listesi: \(worker)")
    }
    
    func extraCommand(completionBlock: () -> Void)  {
        print("Completion Block")
        completionBlock()
    }
}

let company = Company()
company.addEmployee(name: "tarık", age: "20", status: "Bekar", type: "Junior")
company.addEmployee(name: "ahmet", age: "25", status: "Bekar", type: "Middle")
company.addEmployee(name: "efe", age: "30", status: "Evli", type: "Senior")
company.revenueManagement(revenue: 1000)
company.expenseManagement(expense: 0)
company.salaryPayment()
company.companyInfo()
company.extraCommand {
    print("After the completion block")
}
