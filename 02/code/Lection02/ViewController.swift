//
//  ViewController.swift
//  Lection02
//
//  Created by Gennady Evstratov on 11/03/2017.
//  Copyright © 2017 Mail. All rights reserved.
//

import UIKit

class SegeuIdentifiers {
    static let segueName = "Segue1"
}


class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField?
    @IBOutlet weak var helloLabel: UILabel?
    @IBOutlet weak var ageLabel: UILabel?
    @IBOutlet weak var ageStepper: UIStepper?
    @IBOutlet weak var genderSegment: UISegmentedControl?
    @IBOutlet weak var enabledSwitch: UISwitch?
    @IBOutlet weak var extendedView: UIView?
    
    fileprivate var greeting: Greeting = Greeting.empty {
        didSet {
            helloLabel?.text = greeting.greeting
        }
    }

    var name: String {
        let text = nameField?.text ?? ""
        
        return text.isEmpty ? "Анон" : text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }

    @IBAction func helloButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: segueName, sender: nil)
    }

    @IBAction func valueChanged(_ sender: Any) {
        let gender = Gender(rawValue: genderSegment?.selectedSegmentIndex ?? 2) ?? .unknown
        let age  = Int(ageStepper?.value ?? 0)

        ageLabel?.text = "Лет: \(age)"
        greeting = Greeting(name: name, gender: gender, age: age)
    }
    
    @IBAction func extendedEnabledChanged(_ sender: Any) {
        guard let isEnabled = (sender as? UISwitch)?.isOn else {
            return
        }

        extendedView?.isHidden = !isEnabled
    }
    
    @IBAction func alphaSliderChanged(_ sender: Any) {
        guard let slider = sender as? UISlider else {
            return
        }
        
        enabledSwitch?.alpha = CGFloat(slider.value)
    }
    
    @IBAction func showXIBPressed(_ sender: Any) {
        let viewController = XIBViewController(nibName: "XIBViewController", bundle: nil)
        
        viewController.test = "test"
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        switch segueIdentifier {
        case SegueIdentifiers.segueName:
            guard let viewController = segue.destination as? HelloViewController else {
                return
            }            
            viewController.name = name
            
        default:
            break
        }
    }
}


