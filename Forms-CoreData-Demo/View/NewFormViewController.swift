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
    //MARK:- Outlets
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

    //MARK: Class objects
    let pickerView = UIPickerView()
    let datePickerView = UIDatePicker()

    var selectedTextField: UITextField?
    var selectedPickerIndex = 0

    //MARK: ViewModel instance
    let newFormViewModel = NewFormViewModel()
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViewProperties()
    }
    
    //MARK: - Handle View Elements
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
        
        createPickerView()
        createDatePicker()
    }
    
    //MARK: PickerViews
    func createPickerView()  {
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        pickerView.dataSource = self
        pickerView.delegate = self
        rateTextField.inputAccessoryView = toolbar
        rateTextField.inputView = pickerView
        paymentTextField.inputAccessoryView = toolbar
        paymentTextField.inputView = pickerView
        jobTermTextField.inputAccessoryView = toolbar
        jobTermTextField.inputView = pickerView
    }
    
    func createDatePicker(){
        datePickerView.datePickerMode = .date
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        self.dateTextField.inputAccessoryView = toolbar
        self.dateTextField.inputView = datePickerView
    }
    
    //MARK: - IBActions
    @IBAction func addNewAttachmentAction(_ sender: Any) {
        
    }
    
    @IBAction func previewAttachmentOneAction(_ sender: Any) {
        
    }
    
    @IBAction func previewAttachmentTwoAction(_ sender: Any) {
        
    }
    
    @IBAction func sendButtonAction(_ sender: Any) {
        guard let titleText = formTitleTextField.text, formTitleTextField.text?.isEmpty == false else {
            updateRequiredFields(currentField: formTitleTextField)
            return
        }
        
        guard let descriptionText = formDescriptionTextField.text, formDescriptionTextField.text?.isEmpty == false else {
            updateRequiredFields(currentField: formDescriptionTextField)
            return
        }
        
        guard let budgetText = budgetTextField.text, budgetTextField.text?.isEmpty == false else {
            updateRequiredFields(currentField: budgetTextField)
            return
        }
        
        let budget = Int(budgetText)!
        
        let rate = !rateTextField.isEmpty() ? Rate(rawValue: rateTextField!.text!) ?? .noPreference : .noPreference
        let payment = !paymentTextField.isEmpty() ? PaymentMethod(rawValue: paymentTextField!.text!) ?? .noPreference: .noPreference
        let job = !self.jobTermTextField.isEmpty() ? JobTerm(rawValue: self.jobTermTextField!.text!) ?? .noPreference: .noPreference
        let dateText = dateTextField.text ?? ""

        newFormViewModel.saveFormData(formTitle: titleText, description: descriptionText, budget: budget, rate: rate, payment: payment, jobTerm: job, startDate: dateText, attachmentPath: "")
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: Picker completion Actions
extension NewFormViewController {
    @objc func donedatePicker(){
        if selectedTextField == self.dateTextField {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM dd, yyyy"
            selectedTextField?.text = formatter.string(from: datePickerView.date)
        }
        else {
            if let activeTextField = selectedTextField, activeTextField.isEmpty() {
                switch selectedTextField {
                case rateTextField:
                    selectedTextField?.text = Rate.allCases[selectedPickerIndex].rawValue
                    
                case paymentTextField:
                    selectedTextField?.text = PaymentMethod.allCases[selectedPickerIndex].rawValue
                    
                case jobTermTextField:
                    selectedTextField?.text = JobTerm.allCases[selectedPickerIndex].rawValue
                    
                default:
                    selectedTextField?.text = ""
                }

            }
        }
        self.view.endEditing(true)
        validateRequiredFields()
    }
        
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
}

//MARK: Helper Methods
extension NewFormViewController {
    func validateRequiredFields() {
        if (!formTitleTextField.isEmpty()
            && !budgetTextField.isEmpty()
            && !dateTextField.isEmpty()) {
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }
        else {
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }


    func updateRequiredFields(currentField:UITextField) {
        self.setRequiredLabelsTheme(view: currentField, color: UIColor.darkGray)

        switch currentField {
        case self.budgetTextField:
            if self.formTitleTextField.isEmpty() {
                self.setRequiredLabelsTheme(view: self.formTitleTextField, color: UIColor.red)
            }
        case self.rateTextField:
            if self.formTitleTextField.isEmpty() {
                self.setRequiredLabelsTheme(view: self.formTitleTextField, color: UIColor.red)
            }
            if self.budgetTextField.isEmpty() {
                self.setRequiredLabelsTheme(view: self.budgetTextField, color: UIColor.red)
            }
        case self.paymentTextField:
            if self.formTitleTextField.isEmpty() {
                self.setRequiredLabelsTheme(view: self.formTitleTextField, color: UIColor.red)
            }
            if self.budgetTextField.isEmpty() {
                self.setRequiredLabelsTheme(view: self.budgetTextField, color: UIColor.red)
            }
            
        case self.dateTextField:
            if self.formTitleTextField.isEmpty() {
                self.setRequiredLabelsTheme(view: self.formTitleTextField, color: UIColor.red)
            }
            if self.budgetTextField.isEmpty() {
                self.setRequiredLabelsTheme(view: self.budgetTextField, color: UIColor.red)
            }
        case self.jobTermTextField:
            if self.formTitleTextField.isEmpty() {
                self.setRequiredLabelsTheme(view: self.formTitleTextField, color: UIColor.red)
            }
            if self.budgetTextField.isEmpty() {
                self.setRequiredLabelsTheme(view: self.budgetTextField, color: UIColor.red)
            }
            if self.dateTextField.isEmpty() {
                self.setRequiredLabelsTheme(view: self.datePickerView, color: UIColor.red)
            }
            
        default:
            break
        }
    }
    
    func setRequiredLabelsTheme(view:UIView, color:UIColor , hideReqLbl:Bool = false) {
        if let textField = view as? UITextField {
            switch textField {
            case self.formTitleTextField:
                self.formTitleInfoLabel.textColor = (color == UIColor.red) ? color : UIColor.gray
                self.formTitleInfoLabel.isHidden = hideReqLbl
                
            case self.budgetTextField:
                self.budgetInfoLabel.textColor = (color == UIColor.red) ? color : UIColor.gray
                self.budgetInfoLabel.isHidden = hideReqLbl
                
            case self.dateTextField:
                self.dateInfoLabel.textColor = (color == UIColor.red) ? color : UIColor.gray
                self.dateInfoLabel.isHidden = hideReqLbl
                
            default:
                break
            }
        }
        view.layer.addBorder(edge: .bottom, color: color, thickness: 1.0)
    }

}

//MARK: Textfield delegates
extension NewFormViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        pickerView.reloadAllComponents()
        selectedPickerIndex = 0
        pickerView.selectRow(selectedPickerIndex, inComponent: 0, animated: true)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

//MARK: PickerView Delegates
extension NewFormViewController:UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch selectedTextField {
        case rateTextField:
            return Rate.allCases.count
            
        case paymentTextField:
            return PaymentMethod.allCases.count
            
        case jobTermTextField:
            return JobTerm.allCases.count
            
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        switch selectedTextField {
        case rateTextField:
            return Rate.allCases[row].rawValue
            
        case paymentTextField:
            return PaymentMethod.allCases[row].rawValue
            
        case jobTermTextField:
            return JobTerm.allCases[row].rawValue
            
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPickerIndex = row
        switch selectedTextField {
        case rateTextField:
            selectedTextField?.text = Rate.allCases[row].rawValue
            
        case paymentTextField:
            selectedTextField?.text = PaymentMethod.allCases[row].rawValue
            
        case jobTermTextField:
            selectedTextField?.text = JobTerm.allCases[row].rawValue

        default:
            selectedTextField?.text = ""
        }
    }
    
}
