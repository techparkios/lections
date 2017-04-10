//
//  JSONDemoViewControllerTableViewController.swift
//  examples06
//
//  Created by Gennady Evstratov on 08/04/2017.
//  Copyright © 2017 Gennady Evstratov. All rights reserved.
//

import UIKit
import Gloss

fileprivate let sourceURL = "http://127.0.0.1:3000/test.json"

struct SimpleModel: Decodable {
    let name: String

    init(name: String?) {
        self.name = name ?? "no name"
    }
    
    init?(json: JSON) {
        guard let name: String = "name" <~~ json else {
            return nil
        }
        
        self.name = name
    }
}

fileprivate struct Cells {
    static let plain = "TableCell.plain"
}

class JSONDemoViewControllerTableViewController: UITableViewController {

    fileprivate var data: [SimpleModel] = []
    fileprivate let session = URLSession(configuration: URLSessionConfiguration.default)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: Cells.plain)
        tableView?.tableFooterView = UIView()
        
        session.dataTask(with: URL(string: sourceURL)!) { [weak self] data, resp, err in
            guard err == nil else {
                Log.error("error getting file: \(err!)")
                return
            }
            
            guard let data = data, let _models = try? JSONSerialization.jsonObject(with: data, options: .allowFragments), let models = _models as? [[String: Any]] else {
                return
            }
            
            self?.data = models.map { m in
                return SimpleModel(name: m["name"] as? String)
            }
//            guard let data = data, let models = [SimpleModel].from(data: data) else {
//                return
//            }
//            
//            self?.data = models
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.plain, for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row].name
        
        return cell
    }

}
