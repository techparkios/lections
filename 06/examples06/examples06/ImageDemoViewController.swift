//
//  ImageDemoViewController.swift
//  examples06
//
//  Created by Gennady Evstratov on 08/04/2017.
//  Copyright © 2017 Gennady Evstratov. All rights reserved.
//

import UIKit
import SDWebImage

enum Method {
    case dumb
    case fixedDumb
    case session
    case lib
}

fileprivate let imageURL = "http://127.0.0.1:3000/cat.jpg"

class ImageDemoViewController: UIViewController {

    var method: Method = .dumb

    @IBOutlet fileprivate weak var imageView: UIImageView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let url = URL(string: imageURL)!
        switch method {
        case .dumb:
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            
            guard let image = UIImage(data: data) else {
                return
            }
            
            imageView?.image = image
            
        case .fixedDumb:
            DispatchQueue.global(qos: .background).async { [weak self] in
                guard let data = try? Data(contentsOf: url) else {
                    return
                }
                
                guard let image = UIImage(data: data) else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.imageView?.image = image
                }
            }
            
        case .session:
            let session = URLSession(configuration: URLSessionConfiguration.default)
            session.dataTask(with: url) { [weak self] data, res, err in
                guard let data = data, let image = UIImage(data: data) else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.imageView?.image = image
                }
            }.resume()
            
        case .lib:
            imageView?.sd_setImage(with: url)
            
        }
    }

}
