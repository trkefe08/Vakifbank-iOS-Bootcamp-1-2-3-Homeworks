//
//  SitterViewController.swift
//  zooManagement
//
//  Created by Tarik Efe on 19.11.2022.
//

import UIKit

class SitterViewController: UIViewController {

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
    @IBOutlet weak var popUpButton: UIButton!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var addSitterButton: UIButton!
    
    var sitterArray = [String]()
    var animalArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setPopUpButton()
        
    }
    
    @IBAction func addSitterButton(_ sender: Any) {
        if let nameText = self.nameTextField.text, nameText.isEmpty {
            setAlert(message: "Ad kısmı boş kalamaz. Lütfen adınızı giriniz.")
        } else if let ageText = self.ageTextField.text, ageText.isEmpty {
            setAlert(message: "Id kısmı boş kalamaz. Lütfen id numarasını giriniz.")
        } else if let idText = self.idTextField.text, idText.isEmpty {
            setAlert(message: "Yaş kısmı boş kalamaz. Lütfen yaşınızı giriniz.")
        }  
        setArray()
        guard let addSitterVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: ZooViewController.self)) as? ZooViewController else { return }
        addSitterVC.sitterArray += sitterArray
        addSitterVC.animalArray += animalArray
        self.navigationController?.pushViewController(addSitterVC, animated: true)
    }
    
    func setArray() {
        sitterArray.append(nameTextField.text ?? "")
    }
    
    func setAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: {
            return
        })
        
    }
    
    func setPopUpButton() {
        let optionClosure = {(action: UIAction) in
            print(action.title)}
        
        popUpButton.menu = UIMenu(children: [
            UIAction(title: "Çaylak", handler: optionClosure),
            UIAction(title: "Kıdemli", handler: optionClosure),
            UIAction(title: "Uzman", handler: optionClosure),
        ])
        
        popUpButton.showsMenuAsPrimaryAction = true
        popUpButton.changesSelectionAsPrimaryAction = true
    }
    
}
