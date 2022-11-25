//
//  ViewController.swift
//  zooManagement
//
//  Created by Tarik Efe on 17.11.2022.
//

import UIKit

class ZooViewController: UIViewController {

    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var salaryButton: UIButton!
    @IBOutlet weak var valueTextfield: UITextField! {
        didSet {
            valueTextfield.keyboardType = .phonePad
            valueTextfield.textContentType = .telephoneNumber
        }
    }
    @IBOutlet weak var expenseButton: UIButton!
    @IBOutlet weak var incomeButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    @IBOutlet weak var sitterButton: UIButton!
    @IBOutlet weak var animalButton: UIButton!
    @IBOutlet weak var listButton: UIButton! {
        didSet {
            listButton.tintColor = .white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var budget = 0
    var waterLimit = 0
    var animalArray = [String]()
    var sitterArray = [String]()
    
    
    @IBAction func salaryButton(_ sender: Any) {
    }
    
    @IBAction func incomeButton(_ sender: Any) {
        if let value = self.valueTextfield.text, value.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Gelir alanınız boş. Lütfen eklemek istediğiniz değeri girin", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: {
                return
            })
        } else {
            guard let fakeBudget = valueTextfield.text else { return }
            guard let newBudget = Int(fakeBudget) else { return }
            budget += newBudget
            valueTextfield.text = nil
            budgetLabel.text = "\(budget)₺"
            valueTextfield.resignFirstResponder() //değer girilen klavyeyi kapatmak için
            let alert = UIAlertController(title: "Alert", message: "\(newBudget)₺ gelir eklenmiştir.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: {
                return
            })
        }
    }
    
    @IBAction func expenseButton(_ sender: Any) {
        if let value = self.valueTextfield.text, value.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Gider alanınız boş. Lütfen eklemek istediğiniz değeri girin", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: {
                return
            })
        } else {
            guard let fakeBudget = valueTextfield.text else { return }
            guard let newBudget = Int(fakeBudget) else { return }
            budget -= newBudget
            valueTextfield.text = nil
            budgetLabel.text = "\(budget)₺"
            valueTextfield.resignFirstResponder() //değer girilen klavyeyi kapatmak için
            let alert = UIAlertController(title: "Alert", message: "\(newBudget)₺ gider çıkartılmıştır.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            present(alert, animated: true, completion: {
                return
            })
        }
    }
    
    @IBAction func waterButton(_ sender: Any) {
        if let value = self.valueTextfield.text, value.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Su limit alanınız boş. Lütfen eklemek istediğiniz değeri girin", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: {
                return
            })
        } else {
            guard let fakeWater = valueTextfield.text else { return }
            guard let newWater = Int(fakeWater) else { return }
            waterLimit += newWater
            valueTextfield.text = nil
            waterLabel.text = "\(waterLimit)Litre"
            valueTextfield.resignFirstResponder() //değer girilen klavyeyi kapatmak için
            let alert = UIAlertController(title: "Alert", message: "\(waterLimit)litre su eklenmiştir.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: {
                return
            })
        }
    }
    
    @IBAction func animalButton(_ sender: Any) {
        guard let animalVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: AnimalViewController.self)) as? AnimalViewController else { return }
        animalVC.animalArray += animalArray
        animalVC.sitterArray += sitterArray
        self.navigationController?.pushViewController(animalVC, animated: true)
    }
    
    @IBAction func sitterButton(_ sender: Any) {
        guard let sitterVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: SitterViewController.self)) as? SitterViewController else { return }
        sitterVC.animalArray += animalArray
        sitterVC.sitterArray += sitterArray
        self.navigationController?.pushViewController(sitterVC, animated: true)
    }
    
    @IBAction func listButton(_ sender: Any) {
        guard let listVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: ListViewController.self)) as? ListViewController else { return }
        listVC.animalArray += animalArray
        listVC.sitterArray += sitterArray
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
}

