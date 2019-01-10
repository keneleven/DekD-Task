//
//  ViewController.swift
//  DekD_Task
//
//  Created by Nattawut Khuadplod on 10/1/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //use a simple data structure

    //list of title
    var titleName:[String] = ["โพยเตรียมสอบ",
                              "งาน #VMAs",
                              "ซุปกิมจิที่ไหนอร่อย?",
                              "เฟรชชี่ปี1",
                              "บุกกองซีรีส์พ่อบรู๊ค",
                              "กำลังรอพี่ๆตอบรับ Intern อยู่นะ :)"]
    //list of detail
    var detail:[String] = ["อวดโพยเชิญทู้ทนี้! ส่อง \"โพยเตรียมสอบ\" ในวิถีเซียน ละเอียดชนิดหมูบดยังยอมแพ้",
                           "มาดูกัน งาน #VMAs ปีนี้ P!nk สอนอะไรเรา",
                           "ซุปกิมจิที่ไหนอร่อย? ก็ซุปกิมจิที่ทำกินเองไง!",
                           "เปิดวาปเฟรชชี่ปี 1",
                           "น้องณดาน่ารักมาก!! บุกกองซีรีส์พ่อบรู๊ค",
                           "รับผมด้วยนะครับ",]
    
    
    //set tableView
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        addNevBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func back(sender: UIBarButtonItem){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //set AddButton on NavigationBar
    func addNevBar(){
        let  addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemAlert))
        self.navigationItem.rightBarButtonItem = addButton
        
        
    }
    //set BackButton on NavigationBar
    func backNevBar()->UIBarButtonItem{
        let backButton = UIBarButtonItem(title: "ย้อนกลับ",style: .plain, target: self, action: #selector(backToMain))
        return backButton
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleName.count
    }
    
    @objc func backToMain(){
        dismiss(animated: true ,completion: nil)
    }
    
    //Display item func with tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text! = titleName[indexPath.row]
        cell.detailTextLabel?.text! = detail[indexPath.row]
        return cell
    }
    
    // Add Item func
    @objc func addItemAlert(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "ตั้งกระทู้ใหม่",
                                                message: nil,
                                                preferredStyle: .alert)
        
        
        
        let saveBtn = UIAlertAction(title: "บันทึก", style: .default, handler: {(action) -> Void in
            let titleText = alertController.textFields![0]
            let detailText = alertController.textFields![1]
            
            self.titleName.append(titleText.text!)
            self.detail.append(detailText.text!)
            self.tableView.reloadData()
        })
        let cancelBtn = UIAlertAction(title: "ยกเลิก", style: .cancel, handler: {(action) -> Void in})
        
        alertController.addAction(saveBtn)
        alertController.addAction(cancelBtn)
        alertController.addTextField{(titleTextField: UITextField) in
            titleTextField.keyboardAppearance = .default
            titleTextField.keyboardType = .default
            titleTextField.placeholder = "ตั้งชื่อกระทู้"
            titleTextField.clearButtonMode = .whileEditing
        }
        alertController.addTextField{(titleTextField: UITextField) in
            titleTextField.keyboardAppearance = .default
            titleTextField.keyboardType = .default
            titleTextField.placeholder = "รายละเอียด"
            titleTextField.clearButtonMode = .whileEditing
        }
        self.present(alertController,animated: true,completion: nil)
    }
    
    //Delete item func
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            titleName.remove(at: indexPath.row)
            detail.remove(at: indexPath.row)
        }
        self.tableView.reloadData()
    }
    
    //View detail func
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destVC = (segue.destination as! UINavigationController).topViewController as! DeatailViewController
                destVC.titleText = titleName[indexPath.row]
                destVC.detailText = detail[indexPath.row]
                
                //set backButton
                destVC.navigationItem.leftBarButtonItem = backNevBar()
            }
        }
    }
    
}

