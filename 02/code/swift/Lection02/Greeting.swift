//
//  Greeting.swift
//  Lection02
//
//  Created by Gennady Evstratov on 11/03/2017.
//  Copyright © 2017 Mail. All rights reserved.
//

import Foundation

enum Gender: Int {
    case male = 0
    case female = 1
    case unknown = 2
}

struct Greeting {
    let name: String
    let gender: Gender
    let age: Int
    
    static let empty = Greeting(name: "", gender: .unknown, age: -1)
    
    var greeting: String {
        guard age > 0 else {
            return ""
        }
        
        let genderString: String
        switch gender {
        case .male:
            genderString = "милый"
            
        case .female:
            genderString = "милая"
            
        case .unknown:
            genderString = "мил(ый/ая)"
        }
        
        let ageString: String
        if age < 20 {
            switch gender {
            case .male:
                ageString = "юный"
                
            case .female:
                ageString = "юная"
                
            case .unknown:
                ageString = "юн(ый/ая)"
            }
        } else {
            ageString = ""
        }
        
        return "Привет, \(genderString) \(ageString) \(name)!!!"
    }
}

