//
//  NewFormViewModel.swift
//  Forms-CoreData-Demo
//
//  Created by Pankaj Gaikar on 31/01/20.
//  Copyright © 2020 Pankaj Gaikar. All rights reserved.
//

import Foundation

enum Rate: String, CaseIterable {
    case noPreference = "No Preference"
    case fixedBudget = "Fixed Budget"
    case hourlyBudget = "Hourly Budget"
}

enum PaymentMethod: String, CaseIterable {
    case noPreference = "No Preference"
    case ePayment = "E-Payment"
    case cash = "Cash"
}

enum JobTerm:String, CaseIterable {
    case noPreference = "No Preference"
    case recurringJob = "Recurring Job"
    case sameDayJob = "Same Day Job"
    case multiDayJob = "Multi Days Job"
}

class NewFormViewModel {
    
}
