//
//  FormListViewModel.swift
//  Forms-CoreData-Demo
//
//  Created by Pankaj Gaikar on 31/01/20.
//  Copyright © 2020 Pankaj Gaikar. All rights reserved.
//

import Foundation

protocol DataFetchDelegate {
    func dataFetchComplete()
}

class FormListViewModel {
    //Array of data
    var data = [FormData]()
    
    //Data updation protocol instance
    var dataFetchDelegate: DataFetchDelegate?
    
    func retrieveFormData() {
        //FIXME: If fetch can be done on background.
        data = StorageService().retrieveAllForms()
        dataFetchDelegate?.dataFetchComplete()
    }
    
    func deleteForm(id: String) -> Void {
        StorageService().deleteForm(id: id)
        retrieveFormData()
    }
}
