//
//  NewFormViewController.swift
//  Forms-CoreData-Demo
//
//  Created by Pankaj Gaikar on 31/01/20.
//  Copyright © 2020 Pankaj Gaikar. All rights reserved.
//

import UIKit

class NewFormViewController: UIViewController {

    //View Elements
    @IBOutlet weak var formTitleContainer: UIView!
    @IBOutlet weak var formTitleLabel: UILabel!
    @IBOutlet weak var formTitleTextField: UITextField!
    @IBOutlet weak var formTitleInfoLabel: UILabel!
    
    @IBOutlet weak var formDescriptionContainer: UIView!
    @IBOutlet weak var formDescriptionLabel: UILabel!
    @IBOutlet weak var formDescriptionTextField: UITextField!
    @IBOutlet weak var formDescriptionInfoLabel: UILabel!
    
    @IBOutlet weak var budgetContainer: UIView!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var budgetTextField: UITextField!
    @IBOutlet weak var budgetInfoLabel: UILabel!
    
    @IBOutlet weak var currencyContainer: UIView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var currencyInfoLabel: UILabel!
    @IBOutlet weak var currencyImageView: UIImageView!
    
    @IBOutlet weak var rateContainer: UIView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var rateInfoLabel: UILabel!
    
    @IBOutlet weak var paymentContainer: UIView!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var paymentTextField: UITextField!
    @IBOutlet weak var paymentInfoLabel: UILabel!
    
    @IBOutlet weak var dateContainer: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var dateInfoLabel: UILabel!
    
    @IBOutlet weak var jobTermContainer: UIView!
    @IBOutlet weak var jobTermLabel: UILabel!
    @IBOutlet weak var jobTermTextField: UITextField!
    @IBOutlet weak var jobTermInfoLabel: UILabel!
    
    @IBOutlet weak var attachmentContainer: UIView!
    @IBOutlet weak var addNewAttachmentButton: UIButton!
    @IBOutlet weak var attachmentOneButton: UIButton!
    @IBOutlet weak var attachmentTwoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViewProperties()
    }
    
    func initializeViewProperties() {
        formTitleLabel.isHidden = true
        formDescriptionLabel.isHidden = true
        rateLabel.isHidden = true
        currencyLabel.isHidden = true
        jobTermLabel.isHidden = true
        dateLabel.isHidden = true
        paymentLabel.isHidden = true
        budgetLabel.isHidden = true
        
        rateInfoLabel.isHidden = true
        dateInfoLabel.isHidden = true
        budgetInfoLabel.isHidden = true
        paymentInfoLabel.isHidden = true
        currencyInfoLabel.isHidden = true
        jobTermInfoLabel.isHidden = true
        formTitleInfoLabel.isHidden = true
        formDescriptionInfoLabel.isHidden = true
        
        rateTextField.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 1)
        dateTextField.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 1)
        budgetTextField.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 1)
        paymentTextField.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 1)
        currencyTextField.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 1)
        jobTermTextField.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 1)
        formTitleTextField.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 1)
        formDescriptionTextField.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 1)
    }
    
    @IBAction func addNewAttachmentAction(_ sender: Any) {
        
    }
    
    @IBAction func previewAttachmentOneAction(_ sender: Any) {
        
    }
    
    @IBAction func previewAttachmentTwoAction(_ sender: Any) {
        
    }
    
}

extension NewFormViewController {
    
}
