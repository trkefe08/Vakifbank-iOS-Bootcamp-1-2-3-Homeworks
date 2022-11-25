//
//  AddEmployeeViewController.swift
//  companySoftware
//
//  Created by Tarik Efe on 14.11.2022.
//

import UIKit

class AddEmployeeViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField! {
        didSet {
            idTextField.keyboardType = .phonePad
            idTextField.textContentType = .telephoneNumber
        }
    }
    @IBOutlet weak var ageTextField: UITextField! {
        didSet {
            ageTextField.keyboardType = .phonePad
            ageTextField.textContentType = .telephoneNumber
        }
    }
    @IBOutlet weak var statusPopUpButton: UIButton!
    @IBOutlet weak var seniorityPopUpButton: UIButton!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var addEmployeeButton: UIButton!
    @IBOutlet weak var addEmployeeStackView: UIStackView!
    
    var nameArray = [String]()
    var idArray = [String]()
    var salaryArray = [Double]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setPopUpButton()
        
    }
    
    @IBAction func popUpValueChanged(_ sender: Any) {
        salary()
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        salary()
    }
    
    @IBAction func addEmployeeButton(_ sender: Any) {
        if let nameText = self.nameTextField.text, nameText.isEmpty {
            setAlert(message: "Ad kısmı boş kalamaz.Lütfen adınızı giriniz.")
        } else if let idText = self.idTextField.text, idText.isEmpty {
            setAlert(message: "Id kısmı boş kalamaz.Lütfen id'nizi giriniz.")
        } else if let ageText = self.ageTextField.text, ageText.isEmpty {
            setAlert(message: "Yaş kısmı boş kalamaz.Lütfen yaşınızı giriniz.")
        }
       setArray()
        guard let addEmployeeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: CompanyHomeViewController.self)) as? CompanyHomeViewController else { return }
        addEmployeeVC.nameArray += nameArray
        addEmployeeVC.idArray += idArray
        addEmployeeVC.salaryArray += salaryArray
        self.navigationController?.pushViewController(addEmployeeVC, animated: true)
    }
    
    func setPopUpButton() {
        let optionClosure = {(action: UIAction) in
            print(action.title)}
            
            statusPopUpButton.menu = UIMenu(children: [
                UIAction(title: "Evli", handler: optionClosure),
                UIAction(title: "Bekar", handler: optionClosure)
            ])
        
            seniorityPopUpButton.menu = UIMenu(children: [
            UIAction(title: "Junior", handler: optionClosure),
            UIAction(title: "Middle", handler: optionClosure),
            UIAction(title: "Senior", handler: optionClosure)
        ])
        
        statusPopUpButton.showsMenuAsPrimaryAction = true
        statusPopUpButton.changesSelectionAsPrimaryAction = true
        seniorityPopUpButton.showsMenuAsPrimaryAction = true
        seniorityPopUpButton.changesSelectionAsPrimaryAction = true
    }
    
    func salary() {
        let seniority = seniorityPopUpButton.menu?.options.rawValue
        let age = Double(ageTextField.text ?? "")
        if seniorityPopUpButton.menu?.options.rawValue == 0 {
            salaryLabel.text = "\(((age ?? 0) / 20) * (1 * 10_000))₺"
        }
        if seniorityPopUpButton.menu?.options.rawValue == seniority {
            salaryLabel.text = "\(((age ?? 0) / 20) * (2 * 10_000))₺"
        }
        if seniorityPopUpButton.menu?.options.rawValue == seniority {
            salaryLabel.text = "\(((age ?? 0) / 20) * (3 * 10_000))₺"
        }
        
    }
    
    func setArray() {
        nameArray.append(nameTextField.text ?? "")
        idArray.append(idTextField.text ?? "")
        salaryArray.append(Double(salaryLabel.text ?? "") ?? 0.0)
    }
    
    func setAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: {
            return
        })
    }

}

