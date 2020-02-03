//
//  ViewController.swift
//  Forms-CoreData-Demo
//
//  Created by Pankaj Gaikar on 31/01/20.
//  Copyright © 2020 Pankaj Gaikar. All rights reserved.
//

import UIKit

class FormListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let formListViewModel = FormListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100 //Approx
        self.tableView.rowHeight = UITableView.automaticDimension
        
        formListViewModel.dataFetchDelegate = self
        formListViewModel.retrieveFormData()
    }
}

//MARK: TableView Delegates and Datasource
extension FormListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formListViewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FormDataTableViewCell") as! FormDataTableViewCell
        cell.titleLabel.text = formListViewModel.data[indexPath.row].formTitle
        cell.dateLabel.text = formListViewModel.data[indexPath.row].startDate
        cell.rateLabel.text = formListViewModel.data[indexPath.row].rate.rawValue
        cell.jobTermLabel.text = formListViewModel.data[indexPath.row].jobTerm.rawValue
        cell.viewCounterLabel.text = "192 Views" //Hardcoded value atm.
        
        //Deletion requirements
        cell.cellIndex = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

//MARK: Data Fetch Notification
extension FormListViewController: DataFetchDelegate {
    func dataFetchComplete() {
        self.tableView.reloadData()
    }
}

//MARK: Delete Form
extension FormListViewController: FormDataCellDelegate {
    func deleteForm(index: Int) {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
        }
        
        actionSheetController.addAction(cancelAction)
        let deleteAction: UIAlertAction = UIAlertAction(title: "Delete Form", style: .destructive) { action -> Void in
            if self.formListViewModel.data.count > index {
                let formObj = self.formListViewModel.data[index]
                self.formListViewModel.deleteForm(id: formObj.formID)
                self.tableView.reloadData()
            }
        }
        let image = UIImage(named: "Trash_icon")
        deleteAction.setValue(image, forKey: "image")

        actionSheetController.addAction(deleteAction)
        self.present(actionSheetController, animated: true, completion: nil)
    }

}
