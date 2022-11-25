//
//  AnimalViewController.swift
//  zooManagement
//
//  Created by Tarik Efe on 19.11.2022.
//

import UIKit

class AnimalViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var choseAnimalTypeButton: UIButton!
    @IBOutlet weak var addAnimalButton: UIButton!
    
    var animalArray = [String]()
    var sitterArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setPopUpButton()
    }
    
    @IBAction func addAnimalButton(_ sender: Any) {
        if let nameText = self.nameTextField.text, nameText.isEmpty {
            setAlert(message: "Ad kısmı boş kalamaz. Lütfen ekleyeceğiniz hayvanın adını giriniz.")
        } else if let ageText = self.ageTextField.text, ageText.isEmpty {
            setAlert(message: "Id kısmı boş kalamaz. Lütfen ekleyeceğiniz hayvanın id numarasını giriniz.")
        } else if let idText = self.idTextField.text, idText.isEmpty {
            setAlert(message: "Yaş kısmı boş kalamaz. Lütfen ekleyeceğiniz hayvanın yaşını giriniz.")
        }  else if let waterText = self.waterTextField.text, waterText.isEmpty {
            setAlert(message: "Su değer kısmı boş kalamaz. Lütfen ekleyeceğiniz hayvanın su tüketimini giriniz.")
        }
        setArray()
        guard let addAnimalVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: ZooViewController.self)) as? ZooViewController else { return }
        addAnimalVC.animalArray += animalArray
        addAnimalVC.sitterArray += sitterArray
        self.navigationController?.pushViewController(addAnimalVC, animated: true)
    }
    
    func setArray() {
        animalArray.append(nameTextField.text ?? "")
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
        
        choseAnimalTypeButton.menu = UIMenu(children: [
            UIAction(title: "Aslan", handler: optionClosure),
            UIAction(title: "Maymun", handler: optionClosure),
            UIAction(title: "Kuş", handler: optionClosure),
            UIAction(title: "Balık", handler: optionClosure)
        ])
        
        choseAnimalTypeButton.showsMenuAsPrimaryAction = true
        choseAnimalTypeButton.changesSelectionAsPrimaryAction = true
    }
}
