//
//  ViewController.swift
//  DekD_Task
//
//  Created by Nattawut Khuadplod on 10/1/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class DeatailViewController: UIViewController {
    
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DetailLabel: UILabel!
    var titleText:String?
    var detailText:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let titleText = titleText {
            TitleLabel.text = titleText
        }
        
        if let detailText = detailText {
            DetailLabel.text = detailText
        }
    }
}
