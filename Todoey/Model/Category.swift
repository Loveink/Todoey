//
//  Category.swift
//  Todoey
//
//  Created by Александра Савчук on 29.05.2023.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
}
