//
//  FormData.swift
//  Forms-CoreData-Demo
//
//  Created by Pankaj Gaikar on 31/01/20.
//  Copyright © 2020 Pankaj Gaikar. All rights reserved.
//

import Foundation

class FormData {
    var formID:String = UUID().uuidString
    var formTitle:String!
    var formDescription:String?
    var budget:Int!
    var rate:Rate = .noPreference
    var payment:PaymentMethod = .noPreference
    var jobTerm:JobTerm = .noPreference
    var startDate:String!
    var attachmentPath:String?
    
    init(formTitle:String, description:String? = nil, budget:Int, rate:Rate = .noPreference, payment:PaymentMethod = .noPreference, jobTerm:JobTerm = .noPreference, startDate:String, attachmentPath:String? = nil) {
        self.formTitle = formTitle
        self.formDescription = description
        self.budget = budget
        self.rate = rate
        self.payment = payment
        self.jobTerm = jobTerm
        self.startDate = startDate
        self.attachmentPath = attachmentPath
    }
}
