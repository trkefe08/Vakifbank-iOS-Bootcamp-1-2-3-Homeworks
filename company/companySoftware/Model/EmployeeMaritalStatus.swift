//
//  EmployeeMaritalStatus.swift
//  companySoftware
//
//  Created by Tarik Efe on 15.11.2022.
//

import Foundation

enum EmployeeMaritalStatus: Bool {
    case married = true
    case single = false
}

extension Bool: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = value != 0
    }
}

