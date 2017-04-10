//
//  MenuViewController.swift
//  examples06
//
//  Created by Gennady Evstratov on 08/04/2017.
//  Copyright © 2017 Gennady Evstratov. All rights reserved.
//

import UIKit
import Static

import SafariServices

fileprivate struct Segues {
    static let wkDemo = "WKDemoSegue"
    static let jsonDemo = "JSONDemoSegue"
    static let imageDumbDemo = "ImageDumbDemoSegue"
    static let imageFixedDumbDemo = "ImageFixedDumbDemoSegue"
    static let imageSessionDemo = "ImageSessionDemoSegue"
    static let imageLibDemo = "ImageLibDemoSegue"
}

class MenuViewController: UITableViewController {
    
    var dataSource: DataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        dataSource = DataSource(tableView: tableView, sections: [Section(header: "Показ сайта", rows: [
            Row(text: "Safari View Controller", selection: { [unowned self] in
                let viewController = SFSafariViewController(url: URL(string:"http://127.0.0.1:3000/test.html")!)
                self.present(viewController, animated: true, completion: nil)
            }, accessory: .disclosureIndicator)            
            , Row(text: "WKWebView", selection: { [unowned self] in
                self.performSegue(withIdentifier: Segues.wkDemo, sender: nil)
            }, accessory: .disclosureIndicator)

            ])
            , Section(header: "Загрузка данных", rows: [
                Row(text: "JSON", selection: { [unowned self] in
                    self.performSegue(withIdentifier: Segues.jsonDemo, sender: nil)
                    }, accessory: .disclosureIndicator)
                , Row(text: "Картинка (плохо)", selection: { [unowned self] in
                    self.performSegue(withIdentifier: Segues.imageDumbDemo, sender: nil)
                    }, accessory: .disclosureIndicator)
                , Row(text: "Картинка (нормально)", selection: { [unowned self] in
                    self.performSegue(withIdentifier: Segues.imageSessionDemo, sender: nil)
                    }, accessory: .disclosureIndicator)
                , Row(text: "Картинка (библиотека)", selection: { [unowned self] in
                    self.performSegue(withIdentifier: Segues.imageLibDemo, sender: nil)
                    }, accessory: .disclosureIndicator)
                , Row(text: "Картинка (с GCD)", selection: { [unowned self] in
                    self.performSegue(withIdentifier: Segues.imageFixedDumbDemo, sender: nil)
                    }, accessory: .disclosureIndicator)
                ])
            ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case Segues.imageDumbDemo:
            (segue.destination as? ImageDemoViewController)?.method = .dumb
            
        case Segues.imageFixedDumbDemo:
            (segue.destination as? ImageDemoViewController)?.method = .fixedDumb
            
        case Segues.imageSessionDemo:
            (segue.destination as? ImageDemoViewController)?.method = .session
            
        case Segues.imageLibDemo:
            (segue.destination as? ImageDemoViewController)?.method = .lib
            
        default:
            break
        }
    }
    
}
