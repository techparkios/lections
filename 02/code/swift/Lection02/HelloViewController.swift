//
//  HelloViewController.swift
//  Lection02
//
//  Created by Gennady Evstratov on 11/03/2017.
//  Copyright © 2017 Mail. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

    var name: String?
    
    @IBOutlet weak var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let name = name else {
            label?.text = nil
            return
        }
        
        label?.text = "Скоро концерт, \(name), пойдем"
    }
}
