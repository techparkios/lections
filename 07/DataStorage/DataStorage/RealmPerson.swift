//
//  RealmPerson.swift
//  DataStorage
//
//  Created by Gennady Evstratov on 15/04/2017.
//  Copyright © 2017 TechPark. All rights reserved.
//

import RealmSwift

class RealmPerson: Object {
     
    dynamic var id = 0
    dynamic var firstName = ""
    dynamic var lastName = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
