//
//  StorageService.swift
//  Forms-CoreData-Demo
//
//  Created by Pankaj Gaikar on 31/01/20.
//  Copyright © 2020 Pankaj Gaikar. All rights reserved.
//

import Foundation
import CoreData

class StorageService {
    
    public func addItemToDatabase(formData: FormData) {
        let context = AppDelegate.appDelegate.persistentContainer.viewContext
        let entity =  NSEntityDescription.entity(forEntityName: "FormDataModel", in:context)
        let item = NSManagedObject(entity: entity!, insertInto:context)
        item.setValue(formData.formID, forKey: "formID")
        item.setValue(formData.formTitle, forKey: "title")
        item.setValue(formData.formDescription, forKey: "formDescription")
        item.setValue(formData.budget, forKey: "budget")
        item.setValue(formData.rate.rawValue, forKey: "rate")
        item.setValue(formData.payment.rawValue, forKey: "paymentMethod")
        item.setValue(formData.startDate, forKey: "startDate")
        item.setValue(formData.jobTerm.rawValue, forKey: "jobTerm")
        item.setValue(formData.attachmentPath, forKey: "attachment")
        AppDelegate.appDelegate.saveContext()
    }
    
    public func retrieveAllForms() -> [FormData] {
        do {
            let context = AppDelegate.appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<FormDataModel>(entityName: "FormDataModel")
            let fetchedResults = try context.fetch(fetchRequest)
            var formDataArray = [FormData]()
            
            for obj in fetchedResults {
                let formDataObject = FormData(formTitle: obj.title!, description: obj.formDescription, budget: Int(obj.budget), rate: Rate(rawValue: obj.rate!) ?? .noPreference, payment: PaymentMethod(rawValue: obj.paymentMethod!) ?? .noPreference, jobTerm: JobTerm(rawValue: obj.jobTerm!) ?? .noPreference, startDate: obj.startDate ?? " ", attachmentPath: obj.attachment)
                if obj.formID != nil {
                    formDataObject.formID = obj.formID!
                }
                formDataArray.append(formDataObject)
            }
            return formDataArray
        } catch let error as NSError {
            // something went wrong, print the error.
            print(error.description)
        }
        return [FormData]()
    }
    
    public func deleteForm(id: String) {
        //TODO: Needs safety check.
        let fetchRequest = NSFetchRequest<FormDataModel>(entityName: "FormDataModel")
        let predicate = NSPredicate(format: "formID like %@", id)
        fetchRequest.predicate = predicate
        do {
            let context = AppDelegate.appDelegate.persistentContainer.viewContext
            let fetchedResults = try context.fetch(fetchRequest)
            if let object = fetchedResults.first {
                context.delete(object) //Database should have only one entity with ID
                AppDelegate.appDelegate.saveContext()
            }
        } catch let error as NSError {
            print("Unable to delete. Glitch? No Data with ID? Anything else?")
            print(error.description)
        }
        
    }
}
