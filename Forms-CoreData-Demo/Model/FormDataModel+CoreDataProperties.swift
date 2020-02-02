//
//  FormDataModel+CoreDataProperties.swift
//  Forms-CoreData-Demo
//
//  Created by Pankaj Gaikar on 03/02/20.
//  Copyright © 2020 Pankaj Gaikar. All rights reserved.
//
//

import Foundation
import CoreData


extension FormDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FormDataModel> {
        return NSFetchRequest<FormDataModel>(entityName: "FormDataModel")
    }

    @NSManaged public var attachment: String?
    @NSManaged public var budget: Int32
    @NSManaged public var formDescription: String?
    @NSManaged public var formID: String?
    @NSManaged public var jobTerm: String?
    @NSManaged public var paymentMethod: String?
    @NSManaged public var rate: String?
    @NSManaged public var startDate: String?
    @NSManaged public var title: String?

}
