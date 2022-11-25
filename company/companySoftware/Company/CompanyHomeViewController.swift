//
//  ViewController.swift
//  companySoftware
//
//  Created by Tarik Efe on 14.11.2022.
//

import UIKit

class CompanyHomeViewController: UIViewController {
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var foundationYear: UILabel!
    @IBOutlet weak var companyBudget: UILabel!
    @IBOutlet weak var numberOfEmployees: UILabel!
    @IBOutlet weak var incomeBudget: UITextField! {
        didSet {
            incomeBudget.placeholder = "Gelir Ekleyiniz..."
            incomeBudget.keyboardType = .phonePad
            incomeBudget.textContentType = .telephoneNumber
        }
    }
    @IBOutlet weak var addExpense: UITextField! {
        didSet {
            addExpense.placeholder = "Gider Çıkartınız..."
            addExpense.keyboardType = .phonePad
            addExpense.textContentType = .telephoneNumber
        }
    }
    @IBOutlet weak var incomeBudgetButton: UIButton! {
        didSet {
            incomeBudgetButton.layer.cornerRadius = 10
            incomeBudgetButton.setTitle("Gelir Ekle!", for: .normal)
            incomeBudgetButton.setTitleColor(.white, for: .normal)
        }
    }
    @IBOutlet weak var addExpenseButton: UIButton! {
        didSet {
            addExpenseButton.layer.cornerRadius = 10
            addExpenseButton.setTitle("Gider Çıkart!", for: .normal)
            addExpenseButton.setTitleColor(.white, for: .normal)
        }
    }
    @IBOutlet weak var salaryPaymentButton: UIButton! {
        didSet {
            salaryPaymentButton.setTitleColor(.black, for: .normal)
            salaryPaymentButton.layer.cornerRadius = 10
            salaryPaymentButton.setTitle("MAAŞ ÖDE!", for: .normal)
        }
    }
    @IBOutlet weak var addEmployeeButton: UIButton! {
        didSet {
            addEmployeeButton.setTitleColor(.white, for: .normal)
            addEmployeeButton.setTitle("Çalışan Ekle", for: .normal)
            addEmployeeButton.layer.cornerRadius = addEmployeeButton.frame.width / 3
        }
    }
    @IBOutlet weak var employeeListButton: UIButton! {
        didSet {
            employeeListButton.setTitle("Çalışan Listesi", for: .normal)
            employeeListButton.setTitleColor(.white, for: .normal)
            employeeListButton.layer.cornerRadius = addEmployeeButton.frame.width / 3
        }
    }
    var nameArray = [String]()
    var idArray =  [String]()
    var salaryArray = [Double]()
    
    var budget: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyName.text = "VAKIFBANK"
        foundationYear.text = "1954"
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    @IBAction func incomeBudgetButton(_ sender: Any) {
        if let incomeBudgetTextField = self.incomeBudget.text, incomeBudgetTextField.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Gelir alanınız boş. Lütfen eklemek istediğiniz değeri girin", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: {
                return
            })
        } else {
            guard let fakeBudget = incomeBudget.text else { return }
            guard let newBudget = Double(fakeBudget) else { return }
            budget += newBudget
            incomeBudget.text = nil
            companyBudget.text = "\(budget)₺"
            incomeBudget.resignFirstResponder() //değer girilen klavyeyi kapatmak için
            let alert = UIAlertController(title: "Alert", message: "\(newBudget)₺ gelir eklenmiştir.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: {
                return
            })
        }
    }
    
    @IBAction func salaryPayment(_ sender: Any) {
        if let budget = self.companyBudget.text, budget.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Bütçe alanınız boş. Lütfen önce bütçe ekleyiniz.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: {
                return
            })
        }  else {
            for salary in salaryArray {
                var fakeBudget = salary
                var newBudget = Double(fakeBudget)
                budget -= newBudget
                companyBudget.text = "\(budget)"
                let alert = UIAlertController(title: "Alert", message: "\(newBudget)₺ maaş ödenmiştir.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                present(alert, animated: true, completion: {
                    return
                })
            }
        }
    }
    @IBAction func addExpenseButton(_ sender: Any) {
        if let addExpenseTextField = self.addExpense.text, addExpenseTextField.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Gider alanınız boş. Lütfen çıkarmak istediğiniz değeri girin", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            present(alert, animated: true, completion: {
                return
            })
        } else {
            guard let fakeBudget = addExpense.text else { return }
            guard let newBudget = Double(fakeBudget) else { return }
            budget -= newBudget
            addExpense.text = nil
            companyBudget.text = "\(budget)₺"
            addExpense.resignFirstResponder() //değer girilen klavyeyi kapatmak için
            let alert = UIAlertController(title: "Alert", message: "\(newBudget)₺ gider çıkartılmıştır.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            present(alert, animated: true, completion: {
                return
            })
        }
    }
    
    @IBAction func addEmployeeButton(_ sender: Any) {
        guard let employeeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: AddEmployeeViewController.self)) as? AddEmployeeViewController else { return }
        employeeVC.nameArray += nameArray
        employeeVC.idArray += idArray
        employeeVC.salaryArray += salaryArray
        self.navigationController?.pushViewController(employeeVC, animated: true)
    }
    
    @IBAction func employeeListButton(_ sender: Any) {
        guard let employeeListVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: EmployeeListTableViewController.self)) as? EmployeeListTableViewController else { return }
        
        employeeListVC.nameList += nameArray
        employeeListVC.idList += idArray
        self.navigationController?.pushViewController(employeeListVC, animated: true)
    }
}

