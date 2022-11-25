//
//  Employee.swift
//  companySoftware
//
//  Created by Tarik Efe on 15.11.2022.
//

import Foundation

class Employee {
    var name: String
    var age: Int
    var maritalStatus: EmployeeMaritalStatus
    var seniority: EmployeeSeniority
    var id: Int
    var salaryPayment: Int {
        10_000 * seniority.rawValue * (age / 20)
    }
    init(/*budget: Int, */name: String, age: Int, maritalStatus: EmployeeMaritalStatus, seniority: EmployeeSeniority, id: Int) {
        //self.budget = budget
        self.name = name
        self.age = age
        self.maritalStatus = maritalStatus
        self.seniority = seniority
        self.id = id
    }
}
